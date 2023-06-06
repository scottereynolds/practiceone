<?php

namespace App\Form;

use App\Entity\Search;
use App\Entity\Tag;
use App\Repository\TagRepository;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\OptionsResolver\OptionsResolver;

class SearchType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('searchtext', TextType::class, [
            	'required' => false,
                'label' => 'Search',
                'attr' => [
                    'class' => 'form-control',
                ],
            ])
            ->add('tags', EntityType::class, [
            	'required' => false,
                'class' => Tag::class,
                'multiple' => true,
                'expanded' => false,
                'query_builder' => function (TagRepository $tr) {
                    return $tr->createQueryBuilder('t')
                        ->orderBy('t.name', 'ASC');
                },
                'choice_label' => 'name',
                'by_reference' => false,
                'attr' => [
                    'class' => 'form-control',
                ],
                'help' => 'Hold ctrl and click to select multiple Tags.'
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Search::class,
        ]);
    }
}