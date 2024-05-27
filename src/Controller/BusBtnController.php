<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use App\Form\SearchType;
use App\Entity\OfertaEducativa;

class BusBtnController extends AbstractController
{
    #[Route('/busbtn', name: 'app_bus_btn')]
    public function index(Request $request): Response
    {
        $form = $this->createForm(SearchType::class);

        $results = []; // Inicializa los resultados aquí

        if ($request->isMethod('POST')) {
            $form->handleRequest($request);

            if ($form->isSubmitted() && $form->isValid()) {
                $searchTermTecnicatura = $form->get('searchTermTecnicatura')->getData();
            
                $entityManager = $this->getDoctrine()->getManager();
                
                // Busca todas las OfertaEducativa que coinciden con el nombre de la Tecnicatura o el numero del Instituto
                $results = $entityManager->getRepository(OfertaEducativa::class)
                    ->createQueryBuilder('o')
                    ->join('o.tecnicatura', 't')
                    
                    ->where('t.nombre LIKE :searchTermTecnicatura ')
                    ->setParameter('searchTermTecnicatura', '%' . $searchTermTecnicatura . '%')

                    ->getQuery()
                    ->getResult();
            }
        }

        return $this->render('bus_btn/index.html.twig', [
            'form' => $form->createView(),
            'results' => $results,
        ]);
    }
}