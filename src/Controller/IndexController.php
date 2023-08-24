<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\ORM\Tools\Pagination\Paginator;

use App\Entity\City;
use App\Entity\ContractType;
use App\Entity\JobType;
use App\Entity\JobAd;



class IndexController extends AbstractController
{
    #[Route('/')]
    public function index(EntityManagerInterface $entityManager, Request $request): Response
    {    
        $jobAdRepository = $entityManager->getRepository(JobAd::class);

        $cityFilter = $request->query->get('city');
        $contractTypeFilter = $request->query->get('contractType');
        $jobTypeFilter = $request->query->get('jobType');
        $dateFilter = $request->query->get('dateFilter');

    
        $queryBuilder = $jobAdRepository->createQueryBuilder('j')
            ->select('j');

        if ($cityFilter) {
            $queryBuilder->andWhere('j.City = :city')
                ->setParameter('city', $cityFilter);
        }

        if ($contractTypeFilter) {
            $queryBuilder->andWhere('j.ContractType = :contractType')
                ->setParameter('contractType', $contractTypeFilter);
        }

        if ($jobTypeFilter) {
            $queryBuilder->andWhere('j.JobType = :jobType')
                ->setParameter('jobType', $jobTypeFilter);
        }

        if ($dateFilter === 'new') {
            $queryBuilder->orderBy('j.UploadDate', 'DESC');
        } elseif ($dateFilter === 'old') {
            $queryBuilder->orderBy('j.UploadDate', 'ASC');
        }
        

        $totalResults = count($queryBuilder->getQuery()->getResult());
        $page = $request->query->getInt('page', 1); 
        $perPage = 10;

        $queryBuilder->setMaxResults($perPage)->setFirstResult(($page - 1) * $perPage);

        $jobAds = new Paginator($queryBuilder->getQuery());
        $data = [];

        setlocale(LC_TIME, 'fr_FR');
        foreach ($jobAds as $job) {

            $uploadDate = strftime('%A %d %B %Y', $job->getUploadDate()->getTimestamp());

            $data[] = [
                'id' => $job->getId(),
                'image' => $job->getImage(),
                'company' => $job->getCompany()->getName(),
                'city' => $job->getCity()->getName(),
                'contractType' => $job->getContractType()->getContractType(),
                'jobType' => $job->getJobType()->getJobType(),
                'uploadDate' => $uploadDate,
                'jobAdName' => $job->getJobAdName(),
                'description' => $job->getDescription(),
            ];
        }

        $cityList = $entityManager->getRepository(City::class)->findAll();
        foreach ($cityList as $city) {
            $cityData[] = [
                'id' => $city->getId(),
                'cityName' => $city->getName()
            ];
                
        };

        $contractTypeList = $entityManager->getRepository(ContractType::class)->findAll();
        foreach ($contractTypeList as $contractType) {
            $contractTypeData[] = [
                'id' => $contractType->getId(),
                'contractType' => $contractType->getContractType()
            ];
                
        };
        $jobTypeList = $entityManager->getRepository(JobType::class)->findAll();
        foreach ($jobTypeList as $jobType) {
            $jobTypeData[] = [
                'id' => $jobType->getId(),
                'jobType' => $jobType->getJobType()
            ];
                
        };
        return $this->render('index.html.twig', [
            'cities' => $cityData,
            'contracts' => $contractTypeData,
            'jobTypes' => $jobTypeData,
            'data' => $data,
            'totalResults' => $totalResults,
            'currentPage' => $page,
            'perPage' => $perPage,
        ]);
    }
}
