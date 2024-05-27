<?php

namespace App\Entity;

use App\Repository\DistritoRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: DistritoRepository::class)]
class Distrito
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 40)]
    private ?string $nombre = null;

    #[ORM\OneToMany(mappedBy: 'distrito', targetEntity: Localidad::class)]
    private Collection $localidad;

    public function __construct()
    {
        $this->localidad = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNombre(): ?string
    {
        return $this->nombre;
    }

    public function setNombre(string $nombre): static
    {
        $this->nombre = $nombre;

        return $this;
    }

    /**
     * @return Collection<int, Localidad>
     */
    public function getLocalidades(): Collection
    {
        return $this->localidades;
    }

    public function addLocalidade(Localidad $localidade): static
    {
        if (!$this->localidades->contains($localidade)) {
            $this->localidades->add($localidade);
            $localidade->setDistrito($this);
        }

        return $this;
    }

    public function removeLocalidade(Localidad $localidade): static
    {
        if ($this->localidades->removeElement($localidade)) {
            // set the owning side to null (unless already changed)
            if ($localidade->getDistrito() === $this) {
                $localidade->setDistrito(null);
            }
        }

        return $this;
    }
}
