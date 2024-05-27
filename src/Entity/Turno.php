<?php

namespace App\Entity;

use App\Repository\TurnoRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: TurnoRepository::class)]
class Turno
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 16)]
    private ?string $descripcion = null;

    #[ORM\OneToMany(mappedBy: 'turno', targetEntity: OfertaEducativa::class)]
    private Collection $ofertaeducativa;

    public function __construct()
    {
        $this->ofertaeducativa = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getDescripcion(): ?string
    {
        return $this->descripcion;
    }

    public function setDescripcion(string $descripcion): static
    {
        $this->descripcion = $descripcion;

        return $this;
    }

    /**
     * @return Collection<int, OfertaEducativa>
     */
    public function getOfertaeducativa(): Collection
    {
        return $this->ofertaeducativa;
    }

    public function addOfertaeducativa(OfertaEducativa $ofertaeducativa): static
    {
        if (!$this->ofertaeducativa->contains($ofertaeducativa)) {
            $this->ofertaeducativa->add($ofertaeducativa);
            $ofertaeducativa->setTurno($this);
        }

        return $this;
    }

    public function removeOfertaeducativa(OfertaEducativa $ofertaeducativa): static
    {
        if ($this->ofertaeducativa->removeElement($ofertaeducativa)) {
            // set the owning side to null (unless already changed)
            if ($ofertaeducativa->getTurno() === $this) {
                $ofertaeducativa->setTurno(null);
            }
        }

        return $this;
    }

    public function __toString(): string
    {
        return $this->descripcion ?? '';
    }

}
