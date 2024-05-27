<?php

namespace App\Controller;

use App\Entity\Preinscripcion;
use App\Form\PreinscripcionType;
use App\Repository\PreinscripcionRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/preinscripcion')]
class PreinscripcionController extends AbstractController
{
    #[Route('/', name: 'app_preinscripcion_index', methods: ['GET'])]
    public function index(PreinscripcionRepository $preinscripcionRepository): Response
    {
        return $this->render('preinscripcion/index.html.twig', [
            'preinscripcions' => $preinscripcionRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'app_preinscripcion_new', methods: ['GET', 'POST'])]
    public function new(Request $request, PreinscripcionRepository $preinscripcionRepository): Response
    {
        $preinscripcion = new Preinscripcion();
        $form = $this->createForm(PreinscripcionType::class, $preinscripcion);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $preinscripcionRepository->save($preinscripcion, true);

            return $this->redirectToRoute('app_preinscripcion_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('preinscripcion/new.html.twig', [
            'preinscripcion' => $preinscripcion,
           // 'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_preinscripcion_show', methods: ['GET'])]
    public function show(Preinscripcion $preinscripcion): Response
    {
        return $this->render('preinscripcion/show.html.twig', [
            'preinscripcion' => $preinscripcion,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_preinscripcion_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Preinscripcion $preinscripcion, PreinscripcionRepository $preinscripcionRepository): Response
    {
        $form = $this->createForm(PreinscripcionType::class, $preinscripcion);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $preinscripcionRepository->save($preinscripcion, true);

            return $this->redirectToRoute('app_preinscripcion_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('preinscripcion/edit.html.twig', [
            'preinscripcion' => $preinscripcion,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_preinscripcion_delete', methods: ['POST'])]
    public function delete(Request $request, Preinscripcion $preinscripcion, PreinscripcionRepository $preinscripcionRepository): Response
    {
        if ($this->isCsrfTokenValid('delete'.$preinscripcion->getId(), $request->request->get('_token'))) {
            $preinscripcionRepository->remove($preinscripcion, true);
        }

        return $this->redirectToRoute('app_preinscripcion_index', [], Response::HTTP_SEE_OTHER);
    }
}
