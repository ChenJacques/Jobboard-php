<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\ORM\EntityManagerInterface;

use App\Entity\JobAd;
use App\Entity\Company;
use App\Entity\City;
use App\Entity\ContractType;
use App\Entity\JobType;

class JobAdController extends AbstractController
{

    #[Route('/api/job', methods: ['GET'])]
    public function read(Request $request, EntityManagerInterface $entityManager): Response
    {
        $json = json_decode($request->getContent(), true);
        $jobAd = $entityManager->getRepository(JobAd::class)->findOneBy(['id' => $json['id']]);

        if (!$jobAd) {
            return new JsonResponse([
                "message" => "JobAd not found"
            ], 404);
        }

        return new JsonResponse([
            "id" => $jobAd->getId(),
            "Company" => $jobAd->getCompany()->getName(),
            "City" => $jobAd->getCity()->getName(),
            "ContractType" => $jobAd->getContractType()->getContractType(),
            "JobType" => $jobAd->getJobType()->getJobType(),
            "UploadDate" => $jobAd->getUploadDate()->format('d/m/Y'),
            "UpdateDate" => $jobAd->getUpdateDate()->format('d/m/Y'),
            "JobAdName" => $jobAd->getJobAdName(),
            "Description" => $jobAd->getDescription()
        ], 200);
    }

    #[Route('/api/job', methods: ['POST'])]
    public function create(Request $request, EntityManagerInterface $entityManager): Response
    {
        $json = json_decode($request->getContent(), true);

        $jobAd = new JobAd();

        $company = $entityManager->getRepository(Company::class)->findOneBy(['Name' => $json['Company']]);

        if (!$company) {
            $company = new Company();
            $company->setName($json['Company']);
            $entityManager->persist($company);
            $entityManager->flush();
        }
        $jobAd->setCompany($company);

        $city = $entityManager->getRepository(City::class)->findOneBy(['Name' => $json['City']]);
        if (!$city) {
            $city = new City();
            $city->setName($json['City']);
            $entityManager->persist($city);
            $entityManager->flush();
        }
        $jobAd->setCity($city);

        $contractType = $entityManager->getRepository(ContractType::class)->findOneBy(['ContractType' => $json['ContractType']]);
        if (!$contractType) {
            $contractType = new ContractType();
            $contractType->setContractType($json['ContractType']);
            $entityManager->persist($contractType);
            $entityManager->flush();
        }
        $jobAd->setContractType($contractType);

        $jobType = $entityManager->getRepository(JobType::class)->findOneBy(['JobType' => $json['JobType']]);
        if (!$jobType) {
            $jobType = new JobType();
            $jobType->setJobType($json['JobType']);
            $entityManager->persist($jobType);
            $entityManager->flush();
        }
        $jobAd->setJobType($jobType);

        $jobAd->setJobAdName($json['JobAdName']);
        $jobAd->setDescription($json['Description']);
        $jobAd->setUploadDate(new \DateTime());
        $jobAd->setUpdateDate(new \DateTime());
        $entityManager->persist($jobAd);
        $entityManager->flush();
        
        return new JsonResponse([
            "message" => "JobAd created"
        ], 201);
    }

    #[Route('/api/job', methods: ['PATCH'])]
    public function patch(Request $request, EntityManagerInterface $entityManager): Response
    {
        $json = json_decode($request->getContent(), true);
        $jobAd = $entityManager->getRepository(JobAd::class)->findOneBy(['id' => $json['id']]);

        if (!$jobAd) {
            return new JsonResponse([
                "message" => "JobAd not found"
            ], 404);
        }

        $jobAd->setJobAdName($json['JobAdName']);
        $jobAd->setDescription($json['Description']);
        $jobAd->setUpdateDate(new \DateTime());
        
        $entityManager->flush();

        return new JsonResponse([
            "message" => "JobAd updated"
        ], 200);
    }

    #[Route('/api/job', methods: ['DELETE'])]
    public function delete(Request $request, EntityManagerInterface $entityManager): Response
    {
        $json = json_decode($request->getContent(), true);
        $jobAd = $entityManager->getRepository(JobAd::class)->findOneBy(['id' => $json['id']]);

        if (!$jobAd) {
            return new JsonResponse([
                "message" => "JobAd not found"
            ], 404);
        }

        $entityManager->remove($jobAd);
        $entityManager->flush();

        return new JsonResponse([
            "message" => "JobAd deleted"
        ], 200);
    }
}
