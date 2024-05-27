<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use App\Entity\Preinscripcion; 
use App\Form\PreinscripcionType;
use Symfony\Component\HttpFoundation\Session\SessionInterface; 

class PreBtnController extends AbstractController
{
    #[Route('/prebtn', name: 'app_pre_btn')]
    public function index(Request $request, SessionInterface $session): Response // Agrega la SessionInterface
    {
        $preinscripcion = new Preinscripcion();
        $form = $this->createForm(PreinscripcionType::class, $preinscripcion);

        if ($request->isMethod('POST')) {
            $form->handleRequest($request);

            if ($form->isSubmitted() && $form->isValid()) {
                // Realiza la lógica de persistencia aquí
                $entityManager = $this->getDoctrine()->getManager();
                $entityManager->persist($preinscripcion);
                $entityManager->flush();
                $session->getFlashBag()->add('success', 'Inscripción realizada correctamente.');
                // Redirige a donde desees después de guardar los datos
                return $this->redirectToRoute('app_home');
            }
        }

        return $this->render('pre_btn/index.html.twig', [
            'form' => $form->createView(),
        ]);
    }
}


