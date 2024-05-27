<?php

namespace App\Entity;

use App\Repository\TecnicaturaRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: TecnicaturaRepository::class)]
class Tecnicatura
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 100)]
    private ?string $nombre = null;

    #[ORM\Column]
    private ?int $duracion = null;

    #[ORM\Column(nullable: true)]
    private ?int $cantidad_asignaturas = null;

    #[ORM\Column(length: 30)]
    private ?string $numero_resolucion = null;

    #[ORM\ManyToOne(inversedBy: 'tecnicatura')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Modalidad $modalidad = null;

    #[ORM\OneToMany(mappedBy: 'tecnicatura', targetEntity: OfertaEducativa::class)]
    private Collection $ofertaeducativa;

    public function __construct()
    {
        $this->ofertaeducativa = new ArrayCollection();
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

    public function getDuracion(): ?int
    {
        return $this->duracion;
    }

    public function setDuracion(int $duracion): static
    {
        $this->duracion = $duracion;

        return $this;
    }

    public function getCantidadAsignaturas(): ?int
    {
        return $this->cantidad_asignaturas;
    }

    public function setCantidadAsignaturas(?int $cantidad_asignaturas): static
    {
        $this->cantidad_asignaturas = $cantidad_asignaturas;

        return $this;
    }

    public function getNumeroResolucion(): ?string
    {
        return $this->numero_resolucion;
    }

    public function setNumeroResolucion(string $numero_resolucion): static
    {
        $this->numero_resolucion = $numero_resolucion;

        return $this;
    }

    public function getModalidad(): ?Modalidad
    {
        return $this->modalidad;
    }

    public function setModalidad(?Modalidad $modalidad): static
    {
        $this->modalidad = $modalidad;

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
            $ofertaeducativa->setTecnicatura($this);
        }

        return $this;
    }

    public function removeOfertaeducativa(OfertaEducativa $ofertaeducativa): static
    {
        if ($this->ofertaeducativa->removeElement($ofertaeducativa)) {
            // set the owning side to null (unless already changed)
            if ($ofertaeducativa->getTecnicatura() === $this) {
                $ofertaeducativa->setTecnicatura(null);
            }
        }

        return $this;
    }

    public function __toString(): string
    {
        return $this->getNombre();
    }

}
