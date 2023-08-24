<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230822081639 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE city (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE company (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE contract_type (id INT AUTO_INCREMENT NOT NULL, contract_type VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE job_ad (id INT AUTO_INCREMENT NOT NULL, company_id INT NOT NULL, city_id INT NOT NULL, contract_type_id INT NOT NULL, job_type_id INT NOT NULL, upload_date DATE NOT NULL, update_date DATE NOT NULL, job_ad_name VARCHAR(255) NOT NULL, INDEX IDX_C339C4A1979B1AD6 (company_id), INDEX IDX_C339C4A18BAC62AF (city_id), INDEX IDX_C339C4A1CD1DF15B (contract_type_id), INDEX IDX_C339C4A15FA33B08 (job_type_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE job_type (id INT AUTO_INCREMENT NOT NULL, job_type VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE job_ad ADD CONSTRAINT FK_C339C4A1979B1AD6 FOREIGN KEY (company_id) REFERENCES company (id)');
        $this->addSql('ALTER TABLE job_ad ADD CONSTRAINT FK_C339C4A18BAC62AF FOREIGN KEY (city_id) REFERENCES city (id)');
        $this->addSql('ALTER TABLE job_ad ADD CONSTRAINT FK_C339C4A1CD1DF15B FOREIGN KEY (contract_type_id) REFERENCES contract_type (id)');
        $this->addSql('ALTER TABLE job_ad ADD CONSTRAINT FK_C339C4A15FA33B08 FOREIGN KEY (job_type_id) REFERENCES job_type (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE job_ad DROP FOREIGN KEY FK_C339C4A1979B1AD6');
        $this->addSql('ALTER TABLE job_ad DROP FOREIGN KEY FK_C339C4A18BAC62AF');
        $this->addSql('ALTER TABLE job_ad DROP FOREIGN KEY FK_C339C4A1CD1DF15B');
        $this->addSql('ALTER TABLE job_ad DROP FOREIGN KEY FK_C339C4A15FA33B08');
        $this->addSql('DROP TABLE city');
        $this->addSql('DROP TABLE company');
        $this->addSql('DROP TABLE contract_type');
        $this->addSql('DROP TABLE job_ad');
        $this->addSql('DROP TABLE job_type');
    }
}
