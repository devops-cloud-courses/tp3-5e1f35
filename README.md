# Cloud public - TP3

## Instructions
Durant ce TP, nous allons mettre en oeubre Terraform comme vu durant le cours. Le principe de ce TP sera de déployer Petclinic sur les différents infrastructure que propose AWS (IaaS, PaaS, Container) en n'utilisant uniquement que Terraform. Chaque réponse sera à rendre sous forme de Pull Request dans le repository. Chaque étudiant devra alors commiter les fichiers Terraform nécessaire à la création des environnements.

Un bref rappel de l'architecture de l'application
![Architecture](https://spring-petclinic.github.io/images/petclinic-microservices-architecture.png "Architecture")

Le TP est découpé en deux parties : le fichier ```README.md``` suivant, ainsi qu'un dossier answer qui contiendra la totalité des fichiers Terraform à rendre pour ce TP.

## 1 : Git
### 1.0 : Forker le repo du lab
Suivre le lien présent au tableau pour forker ce repository dans votre repository personnel GitHub Classroom. Si vous avez accès au repository, cela veut dire que la manipulation a bien fonctionné.

### 1.1 : Cloner le repository
Clonez le repo nouvellement copié sur votre ordinateur 
> A partir de maintenant, **vous ne travaillerez plus que dans votre copie**. Vous n'avez plus à revenir sur [le projet parent](https://github.com/cours-hei/tp3).

Pour des questions de simplicité, les fichiers `main.tf` et `provider.tf` sont fournis dans chacun des dossiers.

## 2 : Terraform
### 2.0 : Installation de Terraform
Afin de pouvoir effectuer ce TP, il est nécessaire d'installer Terraform. La page d'installation de Terraform est disponible à l'adresse suivante : https://www.terraform.io/downloads.html

### 2.1 : Accès à votre console AWS
Pour avoir accès à votre console AWS, il est nécessaire de récupérer les `access_key`, `secret_key` et `token` de votre compte AWS Edudate. Pour se faire, se connecter à son compte AWS et cliquer sur `Account details` en dessous de `Your AWS Account Status`
<img src="images/account-status.png" width="50%" />

Ensuite, il suffit de récupérer les informations affichées et de les copier/coller dans les fichiers `provider.tf` fournis
<img src="images/account-details.png" width="75%" />

## 3 : IaaS
### 3.0 : Installation de PetClinic
Le principe de ce premier TP est de créer le(s) fichier(s) nécessaire(s) pour la création d'une machine virtuelle contenant PetClinic et sa base de données MariaDB.

Pour ce TP, il est nécessaire de créer les objets suivants sur AWS :
- [aws_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)
- [aws_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc)
- [aws_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)
- [aws_internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway)
- [aws_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)
- [aws_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association)
- [aws_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)

Afin de pouvoir interragir avec la machine virtuelle nouvellement créée, il sera nécessaire de passer par un provisionner de type [`remote-exec`](https://www.terraform.io/docs/provisioners/remote-exec.html).

> ⚠️  **WARNING**: Penser à bien commiter les fichiers dans le dossier correspondant avant de passer à la suite

## PaaS

* Créer une base de données RDS MySQL
* Installer les {schema,data}.sql
* Récuperer la connexion
* Modifier PetClinic
* Créer un Elastic Beanstalk
* Déployer PetClinic sur Elastic Beanstalk
* Vérifier que PetClinic fonctionne

## 4 : Docker
### 4.0 : Installation de Docker
Afin de pouvoir dérouler ce TP, il est nécessaire d'installer Docker. Pour se faire, aller à l'url suivante : https://www.docker.com/products/docker-desktop et suivre les instructions.