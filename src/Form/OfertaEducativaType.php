<?php

namespace App\Form;

use App\Entity\OfertaEducativa;
use App\Entity\Tecnicatura;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class OfertaEducativaType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            //->add('ciclo_lectivo')
            //->add('cupo')
            ->add('tecnicatura')
            ->add('instituto')
            ->add('turno')            
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => OfertaEducativa::class,
        ]);
    }
}
