<?php

namespace App\Entity;

use App\Repository\JobAdRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: JobAdRepository::class)]
class JobAd
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\ManyToOne(inversedBy: 'jobAds')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Company $Company = null;

    #[ORM\ManyToOne(inversedBy: 'jobAds')]
    #[ORM\JoinColumn(nullable: false)]
    private ?City $City = null;

    #[ORM\ManyToOne(inversedBy: 'jobAds')]
    #[ORM\JoinColumn(nullable: false)]
    private ?ContractType $ContractType = null;

    #[ORM\ManyToOne(inversedBy: 'jobAds')]
    #[ORM\JoinColumn(nullable: false)]
    private ?JobType $JobType = null;

    #[ORM\Column(type: Types::DATE_MUTABLE)]
    private ?\DateTimeInterface $UploadDate = null;

    #[ORM\Column(type: Types::DATE_MUTABLE)]
    private ?\DateTimeInterface $UpdateDate = null;

    #[ORM\Column(length: 255)]
    private ?string $JobAdName = null;

    #[ORM\Column(length: 255)]
    private ?string $Description = null;

    #[ORM\Column(length: 255)]
    private ?string $image = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getCompany(): ?Company
    {
        return $this->Company;
    }

    public function setCompany(?Company $Company): static
    {
        $this->Company = $Company;

        return $this;
    }

    public function getCity(): ?City
    {
        return $this->City;
    }

    public function setCity(?City $City): static
    {
        $this->City = $City;

        return $this;
    }

    public function getContractType(): ?ContractType
    {
        return $this->ContractType;
    }

    public function setContractType(?ContractType $ContractType): static
    {
        $this->ContractType = $ContractType;

        return $this;
    }

    public function getJobType(): ?JobType
    {
        return $this->JobType;
    }

    public function setJobType(?JobType $JobType): static
    {
        $this->JobType = $JobType;

        return $this;
    }

    public function getUploadDate(): ?\DateTimeInterface
    {
        return $this->UploadDate;
    }

    public function setUploadDate(\DateTimeInterface $UploadDate): static
    {
        $this->UploadDate = $UploadDate;

        return $this;
    }

    public function getUpdateDate(): ?\DateTimeInterface
    {
        return $this->UpdateDate;
    }

    public function setUpdateDate(\DateTimeInterface $UpdateDate): static
    {
        $this->UpdateDate = $UpdateDate;

        return $this;
    }

    public function getJobAdName(): ?string
    {
        return $this->JobAdName;
    }

    public function setJobAdName(string $JobAdName): static
    {
        $this->JobAdName = $JobAdName;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->Description;
    }

    public function setDescription(string $Description): static
    {
        $this->Description = $Description;

        return $this;
    }

    public function getImage(): ?string
    {
        return $this->image;
    }

    public function setImage(string $image): static
    {
        $this->image = $image;

        return $this;
    }
}
