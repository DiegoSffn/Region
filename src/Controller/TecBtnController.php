<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\TecnicaturaRepository;

class TecBtnController extends AbstractController
{
    #[Route('/tecbtn', name: 'app_tec_btn')]
    public function index(TecnicaturaRepository $tecnicaturaRepository): Response
{
    $tecnicaturas = $tecnicaturaRepository->findAll(); // O cualquier otro método para obtener las tecnicaturas
    
    return $this->render('tec_btn/index.html.twig', [
        'tecnicaturas' => $tecnicaturas,
    ]);
}
}
