<?php

namespace App\Controller;

use App\Entity\Company;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;
use Faker\Factory;

use App\Entity\City;
use App\Entity\ContractType;
use App\Entity\JobType;
use App\Entity\JobAd;
use App\Tools\ImageAPI;


class TestController extends AbstractController
{
    #[Route('/test')]
    public function index(EntityManagerInterface $entityManager): JsonResponse
    {

        $faker = Factory::create('fr_FR');

        $imageAPI = new ImageAPI();
        
        for ($i = 0; $i < 50; $i++) {

            $jobPostName = ['Développeur', 'Designer', 'Marketing', 'Communication', 'Commercial', 'RH', 'Finance', 'Juridique', 'Autre'];
            $randKey = array_rand($jobPostName);

            $jobAd = new JobAd();
        
            $rand = rand(1, 20);
            $company = $entityManager->getRepository(Company::class)->findOneBy(['id' => $rand]);
            $jobAd->setCompany($company);
        
            $rand = rand(1, 20);
            $city = $entityManager->getRepository(City::class)->findOneBy(['id' => $rand]);  
            $jobAd->setCity($city);
        
            $rand = rand(1, 5);
            $contractType = $entityManager->getRepository(ContractType::class)->findOneBy(['id' => $rand]);
            $jobAd->setContractType($contractType);

            $rand = rand(1, 9);
            $jobType = $entityManager->getRepository(JobType::class)->findOneBy(['id' => $rand]);
            $jobAd->setJobType($jobType);
        
            $jobAd->setUploadDate($faker->dateTimeBetween('-1 years', 'now'));
            $jobAd->setUpdateDate($faker->dateTimeBetween('-1 years', 'now'));
            $jobAd->setJobAdName($jobPostName[$randKey]);
            $jobAd->setDescription("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.");

            $url = $imageAPI->getImage();
            $jobAd->setImage($url);
        
            $entityManager->persist($jobAd);

        }
        $entityManager->flush();

        return new JsonResponse([
            'OK'
        ]);
    }
}
