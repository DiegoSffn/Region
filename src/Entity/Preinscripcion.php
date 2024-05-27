<?php

namespace App\Entity;

use App\Repository\PreinscripcionRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: PreinscripcionRepository::class)]
class Preinscripcion
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(type: Types::DATE_MUTABLE)]
    private ?\DateTimeInterface $fecha = null;

    #[ORM\ManyToOne(inversedBy: 'preinscripcion', cascade: ['persist'])]
    #[ORM\JoinColumn(nullable: false)]
    private ?Alumno $alumno = null;

    #[ORM\ManyToOne(inversedBy: 'preinscripcion')]
    #[ORM\JoinColumn(nullable: false)]
    private ?OfertaEducativa $ofertaEducativa = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getFecha(): ?\DateTimeInterface
    {
        return $this->fecha;
    }

    public function setFecha(\DateTimeInterface $fecha): static
    {
        $this->fecha = $fecha;

        return $this;
    }

    public function getAlumno(): ?Alumno
    {
        return $this->alumno;
    }

    public function setAlumno(?Alumno $alumno): static
    {
        $this->alumno = $alumno;

        return $this;
    }

    public function getOfertaEducativa(): ?OfertaEducativa
    {
        return $this->ofertaEducativa;
    }

    public function setOfertaEducativa(?OfertaEducativa $ofertaEducativa): static
    {
        $this->ofertaEducativa = $ofertaEducativa;

        return $this;
    }


    public function __toString(): string
    {
        return sprintf(
            'ID: %s | Fecha: %s | Alumno: %s | Oferta Educativa: %s',
            $this->id,
            $this->fecha ? $this->fecha->format('Y-m-d') : 'N/A',
            $this->alumno ? $this->alumno->getId() : 'N/A',
            $this->ofertaEducativa ? $this->ofertaEducativa->getId() : 'N/A'
        );
    }


}
