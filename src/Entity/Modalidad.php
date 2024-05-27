<?php

namespace App\Entity;

use App\Repository\ModalidadRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ModalidadRepository::class)]
class Modalidad
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 20)]
    private ?string $descripcion = null;

    #[ORM\OneToMany(mappedBy: 'modalidad', targetEntity: Tecnicatura::class)]
    private Collection $tecnicatura;

    public function __construct()
    {
        $this->tecnicatura = new ArrayCollection();
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
     * @return Collection<int, Tecnicatura>
     */
    public function getTecnicatura(): Collection
    {
        return $this->tecnicatura;
    }

    public function addTecnicatura(Tecnicatura $tecnicatura): static
    {
        if (!$this->tecnicatura->contains($tecnicatura)) {
            $this->tecnicatura->add($tecnicatura);
            $tecnicatura->setModalidad($this);
        }

        return $this;
    }

    public function removeTecnicatura(Tecnicatura $tecnicatura): static
    {
        if ($this->tecnicatura->removeElement($tecnicatura)) {
            // set the owning side to null (unless already changed)
            if ($tecnicatura->getModalidad() === $this) {
                $tecnicatura->setModalidad(null);
            }
        }

        return $this;
    }

    public function __toString(): string
    {
        return $this->descripcion ?? '';
    }
    
}
