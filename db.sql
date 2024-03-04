mysql> create database DjallabaSoft;
Query OK, 1 row affected (0.03 sec)

mysql> use DjallabaSoft;
Database changed
mysql> create table Dept(
    -> NumD int primary key,
    -> NomD varchar(30),
    -> Lieu varchar(45));
Query OK, 0 rows affected (0.06 sec)

mysql> create table Emp(
    -> numE int primary key,
    -> nomE varchar(30),
    -> F^C
mysql> create table Emp(
    -> NumE int primary key,
    -> NomE varchar(30),
    -> Fonction varchar(20),
    -> NumS int,
    -> Embauche date,
    -> Salaire double,
    -> Comm double,
    -> NumD int,
    -> foreign key (NumS) references emp(NumE),
    -> foreign key (NumD) references dept(NumD));
Query OK, 0 rows affected (0.08 sec)

mysql> desc Emp;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| NumE     | int         | NO   | PRI | NULL    |       |
| NomE     | varchar(30) | YES  |     | NULL    |       |
| Fonction | varchar(20) | YES  |     | NULL    |       |
| NumS     | int         | YES  | MUL | NULL    |       |
| Embauche | date        | YES  |     | NULL    |       |
| Salaire  | double      | YES  |     | NULL    |       |
| Comm     | double      | YES  |     | NULL    |       |
| NumD     | int         | YES  | MUL | NULL    |       |
+----------+-------------+------+-----+---------+-------+
8 rows in set (0.01 sec)

mysql> desc Dept;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| NumD  | int         | NO   | PRI | NULL    |       |
| NomD  | varchar(30) | YES  |     | NULL    |       |
| Lieu  | varchar(45) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> insert into dept
    -> values
    -> (101 , 'Ventes', 'Gueliz'),
    -> (102, 'Ressources humaines', 'Azli'),
    -> (100, 'Informatique', 'Azli'),
    -> (105, 'Comptabilité', 'Socoma');
Query OK, 4 rows affected (0.02 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> insert into emp
    -> values
    -> (1, 'Kbbour', 'Manager', null, '2020-01-01', 5000.00, null, 101),
    -> (2, 'Bouchaib Slami', 'Vendeur', 1, '2020-02-15', 3000.00, 500.00, 101),
    -> (3, 'Ali Thami', 'Vendeur' , 1, '2020-10-03', 3000.00, 300.00, 101),
    -> (4, 'El Alami Rokaya', 'Ingenieur', null, '2020-09-07', 4500.00, 500.00, 100),
    -> (5, 'Fatima Bziouia', 'Femme de menage', null, '2020-11-28', 1500.00, null, 105);
Query OK, 5 rows affected (0.02 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from dept;
+------+---------------------+--------+
| NumD | NomD                | Lieu   |
+------+---------------------+--------+
|  100 | Informatique        | Azli   |
|  101 | Ventes              | Gueliz |
|  102 | Ressources humaines | Azli   |
|  105 | Comptabilité        | Socoma |
+------+---------------------+--------+
4 rows in set (0.00 sec)

mysql> select * from emp;
+------+-----------------+-----------------+------+------------+---------+------+------+
| NumE | NomE            | Fonction        | NumS | Embauche   | Salaire | Comm | NumD |
+------+-----------------+-----------------+------+------------+---------+------+------+
|    1 | Kbbour          | Manager         | NULL | 2020-01-01 |    5000 | NULL |  101 |
|    2 | Bouchaib Slami  | Vendeur         |    1 | 2020-02-15 |    3000 |  500 |  101 |
|    3 | Ali Thami       | Vendeur         |    1 | 2020-10-03 |    3000 |  300 |  101 |
|    4 | El Alami Rokaya | Ingenieur       | NULL | 2020-09-07 |    4500 |  500 |  100 |
|    5 | Fatima Bziouia  | Femme de menage | NULL | 2020-11-28 |    1500 | NULL |  105 |
+------+-----------------+-----------------+------+------------+---------+------+------+
5 rows in set (0.00 sec)

mysql> update emp
    -> set NomE = 'Rokaya El Alami' where NumE = 4;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from emp;
+------+-----------------+-----------------+------+------------+---------+------+------+
| NumE | NomE            | Fonction        | NumS | Embauche   | Salaire | Comm | NumD |
+------+-----------------+-----------------+------+------------+---------+------+------+
|    1 | Kbbour          | Manager         | NULL | 2020-01-01 |    5000 | NULL |  101 |
|    2 | Bouchaib Slami  | Vendeur         |    1 | 2020-02-15 |    3000 |  500 |  101 |
|    3 | Ali Thami       | Vendeur         |    1 | 2020-10-03 |    3000 |  300 |  101 |
|    4 | Rokaya El Alami | Ingenieur       | NULL | 2020-09-07 |    4500 |  500 |  100 |
|    5 | Fatima Bziouia  | Femme de menage | NULL | 2020-11-28 |    1500 | NULL |  105 |
+------+-----------------+-----------------+------+------------+---------+------+------+
5 rows in set (0.00 sec)

mysql> -- Donner la liste des employés ayant une commission (non Null) classée par commission décroissante --
mysql> select * from emp
    -> where Comm is not null
    -> order by Comm desc ;
+------+-----------------+-----------+------+------------+---------+------+------+
| NumE | NomE            | Fonction  | NumS | Embauche   | Salaire | Comm | NumD |
+------+-----------------+-----------+------+------------+---------+------+------+
|    2 | Bouchaib Slami  | Vendeur   |    1 | 2020-02-15 |    3000 |  500 |  101 |
|    4 | Rokaya El Alami | Ingenieur | NULL | 2020-09-07 |    4500 |  500 |  100 |
|    3 | Ali Thami       | Vendeur   |    1 | 2020-10-03 |    3000 |  300 |  101 |
+------+-----------------+-----------+------+------------+---------+------+------+
3 rows in set (0.00 sec)

mysql> -- Donner les noms des personnes embauchées depuis le 01-09-2020 --
mysql> select * from emp
    -> where Embauche > '2020-09-01' ;
+------+-----------------+-----------------+------+------------+---------+------+------+
| NumE | NomE            | Fonction        | NumS | Embauche   | Salaire | Comm | NumD |
+------+-----------------+-----------------+------+------------+---------+------+------+
|    3 | Ali Thami       | Vendeur         |    1 | 2020-10-03 |    3000 |  300 |  101 |
|    4 | Rokaya El Alami | Ingenieur       | NULL | 2020-09-07 |    4500 |  500 |  100 |
|    5 | Fatima Bziouia  | Femme de menage | NULL | 2020-11-28 |    1500 | NULL |  105 |
+------+-----------------+-----------------+------+------------+---------+------+------+
3 rows in set (0.01 sec)

mysql> -- Donnez la liste des employés travaillant à Azli --
mysql> select * from dept
    -> where Lieu = 'Azli' ;
+------+---------------------+------+
| NumD | NomD                | Lieu |
+------+---------------------+------+
|  100 | Informatique        | Azli |
|  102 | Ressources humaines | Azli |
+------+---------------------+------+
2 rows in set (0.00 sec)

mysql> select * from emp
    -> where NumD in (101,102);
+------+----------------+----------+------+------------+---------+------+------+
| NumE | NomE           | Fonction | NumS | Embauche   | Salaire | Comm | NumD |
+------+----------------+----------+------+------------+---------+------+------+
|    1 | Kbbour         | Manager  | NULL | 2020-01-01 |    5000 | NULL |  101 |
|    2 | Bouchaib Slami | Vendeur  |    1 | 2020-02-15 |    3000 |  500 |  101 |
|    3 | Ali Thami      | Vendeur  |    1 | 2020-10-03 |    3000 |  300 |  101 |
+------+----------------+----------+------+------------+---------+------+------+
3 rows in set (0.01 sec)

mysql> -- Donnez la liste des subordonnés de Kbbour --
mysql> select numE from emp
    -> where NomE = 'Kbbour' ;
+------+
| numE |
+------+
|    1 |
+------+
1 row in set (0.00 sec)

mysql> select * from emp
    -> where NumS = 1;
+------+----------------+----------+------+------------+---------+------+------+
| NumE | NomE           | Fonction | NumS | Embauche   | Salaire | Comm | NumD |
+------+----------------+----------+------+------------+---------+------+------+
|    2 | Bouchaib Slami | Vendeur  |    1 | 2020-02-15 |    3000 |  500 |  101 |
|    3 | Ali Thami      | Vendeur  |    1 | 2020-10-03 |    3000 |  300 |  101 |
+------+----------------+----------+------+------------+---------+------+------+
2 rows in set (0.00 sec)

mysql> -- Donnez la moyenne des salaire --
mysql> select avg(Salaire) as Moyenne_Salaire from emp;
+-----------------+
| Moyenne_Salaire |
+-----------------+
|            3400 |
+-----------------+
1 row in set (0.01 sec)

mysql> -- Donnez le nombre de commissions non Null --
mysql> select count(Comm) as Nbr_Commisions from emp
    -> where Comm is not null;
+----------------+
| Nbr_Commisions |
+----------------+
|              3 |
+----------------+
1 row in set (0.00 sec)

mysql> -- Donnez la liste des employés gagnant plus que la moyenne des salaires de l'entreprise --
mysql> select * from emp
    -> where Salaire > (select avg(Salaire) from emp );
+------+-----------------+-----------+------+------------+---------+------+------+
| NumE | NomE            | Fonction  | NumS | Embauche   | Salaire | Comm | NumD |
+------+-----------------+-----------+------+------------+---------+------+------+
|    1 | Kbbour          | Manager   | NULL | 2020-01-01 |    5000 | NULL |  101 |
|    4 | Rokaya El Alami | Ingenieur | NULL | 2020-09-07 |    4500 |  500 |  100 |
+------+-----------------+-----------+------+------------+---------+------+------+
2 rows in set (0.01 sec)

mysql>
