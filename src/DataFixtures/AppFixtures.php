<?php

namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Faker\Factory;

use App\Entity\Company;
use App\Entity\City;
use App\Entity\ContractType;
use App\Entity\JobType;
use App\Entity\JobAd;
use App\Tools\ImageAPI;

class AppFixtures extends Fixture
{
    
    public function load(ObjectManager $manager): void
    {
        $faker = Factory::create('fr_FR');

        for ($i = 0; $i < 20; $i++) {
            $company = new Company();
            $company->setName($faker->company);
            $manager->persist($company);

            $city = new City();
            $city->setName($faker->city);
            $manager->persist($city);
        }

        $contractArray = ['CDI', 'CDD', 'Stage', 'Alternance', 'Freelance'];

        foreach ($contractArray as $contract) {
            $contractType = new ContractType();
            $contractType->setContractType($contract);
            $manager->persist($contractType);
        }

        $jobTypeArray = ['Développement', 'Design', 'Marketing', 'Communication', 'Commercial', 'RH', 'Finance', 'Juridique', 'Autre'];

        foreach ($jobTypeArray as $job) {
            $jobType = new JobType();
            $jobType->setJobType($job);
            $manager->persist($jobType);
        }

        $jobPostName = ['Développeur', 'Designer', 'Marketing', 'Communication', 'Commercial', 'RH', 'Finance', 'Juridique', 'Autre'];
        
        $imageAPI = new ImageAPI();

        for ($i = 0; $i < 50; $i++) {
            $jobAd = new JobAd();
            
            $randKey = array_rand($jobPostName);

            $rand = rand(1, 20);
            $company = $manager->getRepository(Company::class)->findOneBy(['id' => $rand]);
            $jobAd->setCompany($company);

            $rand = rand(1, 20);
            $city = $manager->getRepository(City::class)->findOneBy(['id' => $rand]);  
            $jobAd->setCity($city);
        
            $rand = rand(1, 5);
            $contractType = $manager->getRepository(ContractType::class)->findOneBy(['id' => $rand]);
            $jobAd->setContractType($contractType);

            $rand = rand(1, 9);
            $jobType = $manager->getRepository(JobType::class)->findOneBy(['id' => $rand]);
            $jobAd->setJobType($jobType);
        
            $jobAd->setUploadDate($faker->dateTimeBetween('-1 years', 'now'));
            $jobAd->setUpdateDate($faker->dateTimeBetween('-1 years', 'now'));
            $jobAd->setJobAdName($jobPostName[$randKey]);
            $jobAd->setDescription("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.");

            $url = $imageAPI->getImage();
            $jobAd->setImage($url);
        
            $manager->persist($jobAd);

        }
        $manager->flush();

    }
}
