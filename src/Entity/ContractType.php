<?php

namespace App\Entity;

use App\Repository\ContractTypeRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ContractTypeRepository::class)]
class ContractType
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $ContractType = null;

    #[ORM\OneToMany(mappedBy: 'ContractType', targetEntity: JobAd::class)]
    private Collection $jobAds;

    public function __construct()
    {
        $this->jobAds = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getContractType(): ?string
    {
        return $this->ContractType;
    }

    public function setContractType(string $ContractType): static
    {
        $this->ContractType = $ContractType;

        return $this;
    }

    /**
     * @return Collection<int, JobAd>
     */
    public function getJobAds(): Collection
    {
        return $this->jobAds;
    }

    public function addJobAd(JobAd $jobAd): static
    {
        if (!$this->jobAds->contains($jobAd)) {
            $this->jobAds->add($jobAd);
            $jobAd->setContractType($this);
        }

        return $this;
    }

    public function removeJobAd(JobAd $jobAd): static
    {
        if ($this->jobAds->removeElement($jobAd)) {
            // set the owning side to null (unless already changed)
            if ($jobAd->getContractType() === $this) {
                $jobAd->setContractType(null);
            }
        }

        return $this;
    }
}
