<?php

namespace App\Entity;

use App\Repository\CityRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: CityRepository::class)]
class City
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $Name = null;

    #[ORM\OneToMany(mappedBy: 'City', targetEntity: JobAd::class)]
    private Collection $jobAds;

    public function __construct()
    {
        $this->jobAds = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->Name;
    }

    public function setName(string $Name): static
    {
        $this->Name = $Name;

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
            $jobAd->setCity($this);
        }

        return $this;
    }

    public function removeJobAd(JobAd $jobAd): static
    {
        if ($this->jobAds->removeElement($jobAd)) {
            // set the owning side to null (unless already changed)
            if ($jobAd->getCity() === $this) {
                $jobAd->setCity(null);
            }
        }

        return $this;
    }
}
