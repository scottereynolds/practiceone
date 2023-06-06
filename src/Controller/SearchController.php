<?php

namespace App\Controller;

use App\Entity\Search;
use App\Form\SearchType;
use App\Repository\SearchRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/search')]
class SearchController extends AbstractController
{
	public function __construct(private SearchRepository $searchrepo, private EntityManagerInterface $em) {}

	#[Route('/', name: 'app_search_index', methods: ['GET', 'POST'])]
	public function index(Request $request): Response
	{
		$searchresults = [];
		$searchtagresults = [];
		$searchtextresults = [];
		$search = new Search();
		$form = $this->createForm(SearchType::class, $search);
		$form->handleRequest($request);
		if ($form->isSubmitted() && $form->isValid()) {
			$formdata = $form->getData();
			$this->searchrepo->save($search, true);
	        $tagidarray = [];
	        foreach ($search->getTags() as $tag) {
	        	$tagidarray[] = $tag->getId();
	        }
	        $conn = $this->em->getConnection();
	        if (!is_null($search->getTags()) && !empty($search->getTags()) && count($search->getTags()) > 0) {
		        $sql = "SELECT `b`.*, count(`bt`.`tag_id`) as ranking, group_concat(`t`.`name`) as tag_list FROM `business_tag` `bt` LEFT JOIN `business` `b` ON 	`bt`.`business_id` = `b`.`id` LEFT JOIN `tag` `t` ON `bt`.`tag_id` = `t`.`id` WHERE `bt`.`tag_id` IN (".implode(',', $tagidarray).") GROUP BY `business_id` ORDER BY `ranking` DESC;";
		        $searchtagresults = $conn->executeQuery($sql)
		            ->fetchAll()
		        ;
	        }
	        if (!is_null($search->getSearchtext())) {
		        $sql2 = "SELECT `b`.*, '1' as `ranking`, '' as tag_list FROM `business` `b` WHERE `b`.`name` LIKE \"%".$search->getSearchtext()."%\" OR `b`.`description` LIKE \"%".$search->getSearchtext()."%\";";
		        $searchtextresults = $conn->executeQuery($sql2)
		        	->fetchAll()
		        ;
	        }
	        $searchresults = [];
	        foreach ($searchtagresults as $tagrslt) {
	        	$searchresults[] = $tagrslt;
	        }
	        foreach ($searchtextresults as $textrslt) {
	        	$found = false;
	        	foreach ($searchtagresults as $index => $tagrslt) {
	        		if ($textrslt["id"] == $tagrslt["id"]) {
	        			$found = true;
	        			$searchresults[$index]["ranking"]++;
	        			$searchresults[$index]["tag_list"] .= ",\"".$search->getSearchtext()."\"";
	        			break;
	        		}
	        	}
	        	if (!$found) {
	        		$searchresults[] = $textrslt;
	        	}
	        }
	        usort($searchresults, function($first, $second){
			    return $first["ranking"] < $second["ranking"];
			});
		}

		return $this->render('search/index.html.twig', [
			'form' => $form,
			'searchresults' => $searchresults,
		]);
	}
}