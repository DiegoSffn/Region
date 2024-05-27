<?php

namespace App\Repository;

use App\Entity\Distrito;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Distrito>
 *
 * @method Distrito|null find($id, $lockMode = null, $lockVersion = null)
 * @method Distrito|null findOneBy(array $criteria, array $orderBy = null)
 * @method Distrito[]    findAll()
 * @method Distrito[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class DistritoRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Distrito::class);
    }

//    /**
//     * @return Distrito[] Returns an array of Distrito objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('d')
//            ->andWhere('d.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('d.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?Distrito
//    {
//        return $this->createQueryBuilder('d')
//            ->andWhere('d.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
