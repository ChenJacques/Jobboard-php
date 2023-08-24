<?php

namespace App\Entity;

use App\Repository\JobTypeRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: JobTypeRepository::class)]
class JobType
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $JobType = null;

    #[ORM\OneToMany(mappedBy: 'JobType', targetEntity: JobAd::class)]
    private Collection $jobAds;

    public function __construct()
    {
        $this->jobAds = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getJobType(): ?string
    {
        return $this->JobType;
    }

    public function setJobType(string $JobType): static
    {
        $this->JobType = $JobType;

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
            $jobAd->setJobType($this);
        }

        return $this;
    }

    public function removeJobAd(JobAd $jobAd): static
    {
        if ($this->jobAds->removeElement($jobAd)) {
            // set the owning side to null (unless already changed)
            if ($jobAd->getJobType() === $this) {
                $jobAd->setJobType(null);
            }
        }

        return $this;
    }
}
