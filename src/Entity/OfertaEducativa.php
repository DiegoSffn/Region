<?php

namespace App\Entity;

use App\Repository\OfertaEducativaRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: OfertaEducativaRepository::class)]
class OfertaEducativa
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column]
    private ?int $ciclo_lectivo = null;

    #[ORM\Column(nullable: true)]
    private ?int $cupo = null;

    #[ORM\OneToMany(mappedBy: 'ofertaEducativa', targetEntity: Preinscripcion::class)]
    private Collection $preinscripcion;

    #[ORM\ManyToOne(inversedBy: 'ofertaeducativa')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Tecnicatura $tecnicatura = null;

    #[ORM\ManyToOne(inversedBy: 'ofertaeducativa')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Turno $turno = null;

    #[ORM\ManyToOne(inversedBy: 'ofertaeducativa')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Instituto $instituto = null;

    public function __construct()
    {
        $this->preinscripcion = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getCicloLectivo(): ?int
    {
        return $this->ciclo_lectivo;
    }

    public function setCicloLectivo(int $ciclo_lectivo): static
    {
        $this->ciclo_lectivo = $ciclo_lectivo;

        return $this;
    }

    public function getCupo(): ?int
    {
        return $this->cupo;
    }

    public function setCupo(?int $cupo): static
    {
        $this->cupo = $cupo;

        return $this;
    }

    /**
     * @return Collection<int, Preinscripcion>
     */
    public function getPreinscripcion(): Collection
    {
        return $this->preinscripcion;
    }

    public function addPreinscripcion(Preinscripcion $preinscripcion): static
    {
        if (!$this->preinscripcion->contains($preinscripcion)) {
            $this->preinscripcion->add($preinscripcion);
            $preinscripcion->setOfertaEducativa($this);
        }

        return $this;
    }

    public function removePreinscripcion(Preinscripcion $preinscripcion): static
    {
        if ($this->preinscripcion->removeElement($preinscripcion)) {
            // set the owning side to null (unless already changed)
            if ($preinscripcion->getOfertaEducativa() === $this) {
                $preinscripcion->setOfertaEducativa(null);
            }
        }

        return $this;
    }

    public function getTecnicatura(): ?Tecnicatura
    {
        return $this->tecnicatura;
    }

    public function setTecnicatura(?Tecnicatura $tecnicatura): static
    {
        $this->tecnicatura = $tecnicatura;

        return $this;
    }

    public function getTurno(): ?Turno
    {
        return $this->turno;
    }

    public function setTurno(?Turno $turno): static
    {
        $this->turno = $turno;

        return $this;
    }

    public function getInstituto(): ?Instituto
    {
        return $this->instituto;
    }

    public function setInstituto(?Instituto $instituto): static
    {
        $this->instituto = $instituto;

        return $this;
    }

    public function __toString(): string
    {
        return sprintf(
            'Tecnicatura: %s, Turno: %s, Instituto: %s, Ciclo Lectivo: %d',
            $this->tecnicatura->getNombre(),
            $this->turno->getDescripcion(),
            $this->instituto->getNumero(),
            $this->ciclo_lectivo ?? 0
        );
    }

}
