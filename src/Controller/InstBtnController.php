<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\InstitutoRepository; 

class InstBtnController extends AbstractController
{
    #[Route('/instbtn', name: 'app_inst_btn')]
    public function index(InstitutoRepository $institutoRepository): Response
    {
        $institutos = $institutoRepository->findAll(); // Obtén todos los institutos

        return $this->render('inst_btn/index.html.twig', [
            'institutos' => $institutos, // Pasa los institutos a la plantilla
        ]);
    }
}
