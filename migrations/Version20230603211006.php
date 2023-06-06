<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230603211006 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        $this->addSql('CREATE TRIGGER `business_log_insert` BEFORE INSERT ON `business` FOR EACH ROW BEGIN SET NEW.created = NOW(); SET NEW.modified = NOW(); END;');
        $this->addSql('CREATE TRIGGER `business_log_update` BEFORE UPDATE ON `business` FOR EACH ROW BEGIN SET NEW.modified = NOW(); END;');
        $this->addSql('CREATE TRIGGER `tag_log_insert` BEFORE INSERT ON `tag` FOR EACH ROW BEGIN SET NEW.created = NOW(); SET NEW.modified = NOW(); END;');
        $this->addSql('CREATE TRIGGER `tag_log_update` BEFORE UPDATE ON `tag` FOR EACH ROW BEGIN SET NEW.modified = NOW(); END;');
        $this->addSql('CREATE TRIGGER `user_log_insert` BEFORE INSERT ON `user` FOR EACH ROW BEGIN SET NEW.created = NOW(); SET NEW.modified = NOW(); END;');
        $this->addSql('CREATE TRIGGER `user_log_update` BEFORE UPDATE ON `user` FOR EACH ROW BEGIN SET NEW.modified = NOW(); END;');
        $this->addSql('CREATE TRIGGER `search_log_insert` BEFORE INSERT ON `search` FOR EACH ROW BEGIN SET NEW.created = NOW(); SET NEW.modified = NOW(); END;');
        $this->addSql('CREATE TRIGGER `search_log_update` BEFORE UPDATE ON `search` FOR EACH ROW BEGIN SET NEW.modified = NOW(); END;');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TRIGGER `business_log_insert`;');
        $this->addSql('DROP TRIGGER `business_log_update`;');
        $this->addSql('DROP TRIGGER `tag_log_insert`;');
        $this->addSql('DROP TRIGGER `tag_log_update`;');
        $this->addSql('DROP TRIGGER `user_log_insert`;');
        $this->addSql('DROP TRIGGER `user_log_update`;');
        $this->addSql('DROP TRIGGER `search_log_insert`;');
        $this->addSql('DROP TRIGGER `search_log_update`;');
    }
}
