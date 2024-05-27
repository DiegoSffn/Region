<?php

namespace App\Entity;

use App\Repository\AlumnoRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: AlumnoRepository::class)]
class Alumno
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 100, nullable: true)]
    private ?string $titulo_sec = null;

    #[ORM\Column(length: 100, nullable: true)]
    private ?string $escuela_sec = null;

    #[ORM\Column(nullable: true)]
    private ?int $anio_egreso = null;

    #[ORM\OneToMany(mappedBy: 'alumno', targetEntity: Preinscripcion::class)]
    private Collection $preinscripcion;

    #[ORM\OneToOne(cascade: ['persist', 'remove'])]
    #[ORM\JoinColumn(nullable: false)]
    private ?Persona $persona = null;

    public function __construct()
    {
        $this->preinscripcion = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTituloSec(): ?string
    {
        return $this->titulo_sec;
    }

    public function setTituloSec(?string $titulo_sec): static
    {
        $this->titulo_sec = $titulo_sec;

        return $this;
    }

    public function getEscuelaSec(): ?string
    {
        return $this->escuela_sec;
    }

    public function setEscuelaSec(?string $escuela_sec): static
    {
        $this->escuela_sec = $escuela_sec;

        return $this;
    }

    public function getAnioEgreso(): ?int
    {
        return $this->anio_egreso;
    }

    public function setAnioEgreso(?int $anio_egreso): static
    {
        $this->anio_egreso = $anio_egreso;

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
            $preinscripcion->setAlumno($this);
        }

        return $this;
    }

    public function removePreinscripcion(Preinscripcion $preinscripcion): static
    {
        if ($this->preinscripcion->removeElement($preinscripcion)) {
            // set the owning side to null (unless already changed)
            if ($preinscripcion->getAlumno() === $this) {
                $preinscripcion->setAlumno(null);
            }
        }

        return $this;
    }

    public function getPersona(): ?Persona
    {
        return $this->persona;
    }

    public function setPersona(Persona $persona): static
    {
        $this->persona = $persona;

        return $this;
    }



    public function __toString(): string
    {
        return sprintf(
            'ID: %s | Titulo Sec: %s | Escuela Sec: %s | Año Egreso: %s',
            $this->id,
            $this->titulo_sec ?: 'N/A',
            $this->escuela_sec ?: 'N/A',
            $this->anio_egreso ?: 'N/A'
        );
    }


}
