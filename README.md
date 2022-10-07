# Public Cloud - TP3

## Instructions
During this tutorial, we will implement Terraform as seen during the course. The principle of this tutorial will be to deploy Petclinic on the different infrastructures offered by AWS (IaaS, PaaS, Container) using only Terraform. Each answer will be given as a **Pull Request** in the repository. Each student will then have to commit the Terraform files necessary to create the environments.

A brief reminder of the application's architecture
![Architecture](https://spring-petclinic.github.io/images/petclinic-microservices-architecture.png "Architecture")

The tutorial is divided into two parts: the following `README.md` file, and an `answer` folder which will contain all the Terraform files to be handed in for this tutorial.

## 1: Git
### 1.0 : Fork the lab repo
Follow the link on the board to fork this repository into your personal GitHub Classroom repository. If you have access to the repository, it means that the manipulation worked well.

### 1.1 : Clone the repository
Clone the newly copied repo on your computer 
> From now on, **you will only work in your copy**. You don't have to go back to the [parent project](https://github.com/cours-hei/tp3).

For simplicity, the `main.tf` and `provider.tf` files are provided in each folder.

## 2: Terraform
### 2.0: Installing Terraform
In order to perform this task, it is necessary to install **Terraform**. The Terraform installation page is available at the following address: https://www.terraform.io/downloads.html

### 2.1: Access to your AWS console
To access your AWS console, it is necessary to generate the `access_key` and `secret_key` for your AWS account. To do this, log into your AWS account and click on `My Security Credentials` in your `Account` menu

<img src="images/security-credentials.png" width="25%" />

Next, simply generate the `access_key` and `secret_key` by clicking on the `Create access key` button

<img src="images/access-keys.png" width="75%" />

An `access_key` and a hidden `secret_key` will then be generated

<img src="images/secret-key.png" width="75%" />

To use them, you must then export the `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` environment variables

```
export AWS_ACCESS_KEY_ID="anaccesskey
$ export AWS_SECRET_ACCESS_KEY="asecretkey
$ terraform init
```

> ⚠️  **WARNING**: Don't commit in any ways your `access_key` and `secret_key` in your repository nor a public one. Doing so would allow anyone to access your AWS account !!

## 3: IaaS
### 3.0 : PetClinic installation
The principle of this first tutorial is to create the necessary file(s) to create a virtual machine containing PetClinic and its MariaDB database.

For this tutorial, it is necessary to create the following objects on AWS:
- [aws_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)
- [aws_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc)
- [aws_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)
- [aws_internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway)
- [aws_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)
- [aws_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association)
- [aws_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)

In order to interact with the newly created virtual machine, it will be necessary to go through a provisioner of type [`remote-exec`](https://www.terraform.io/docs/provisioners/remote-exec.html).

> ⚠️ **WARNING**: Remember to commit the files to the corresponding folder before proceeding

> ⚠️ **WARNING**: Once the files are created and committed, remember to destroy the AWS resources created with the `terraform destroy` command

## 4 : PaaS
### 4.0 : PetClinic installation
The principle of this second tutorial is to create the file(s) necessary to create an AWS Beanstalk environment, as well as the associated AWS RDS database.

For this tutorial, it is necessary to create the following objects on AWS:
- [aws_elastic_beanstalk_environment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elastic_beanstalk_environment)
- [aws_elastic_beanstalk_application](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elastic_beanstalk_application)
- [aws_elastic_beanstalk_configuration_template](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elastic_beanstalk_configuration_template)
- [aws_db_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance)

> ⚠️ **WARNING**: Remember to commit the files to the corresponding folder before proceeding

> ⚠️ **WARNING**: Once the files are created and committed, remember to destroy the AWS resources created with the `terraform destroy` command

## 5: Docker
### 5.0 : Installing Docker
In order to run this tutorial, it is necessary to install Docker. To do so, go to the following url: https://www.docker.com/products/docker-desktop and follow the instructions.

### 5.1 : PetClinic
We will now install PetClinic in a Docker container to run it. The purpose of this tutorial is to create the PetClinic runtime image. A `Dockerfile` is already provided with the default settings. All we need to do for this tutorial is to add the instruction lines after the `# TODO` part.

Here is the list of Docker instructions: https://docs.docker.com/engine/reference/builder/

Once the instructions have been added, we now need to create the Docker image and push it into a registry. For this tutorial, we will use the official Docker registry, the Docker hub.

If you don't have an account on the Docker hub, you need to create one here: https://hub.docker.com/signup

Once your hub account is created, you can now push the created images to your account. After adding the instructions, create the Docker image using the [`docker build`] command (https://docs.docker.com/engine/reference/commandline/build/).

Remember to tag your image so that it can be pushed to the Docker hub (https://docs.docker.com/engine/reference/commandline/build/#tag-an-image--t).

In order to verify that the built image works, you can start the newly created image with the [`docker run`](https://docs.docker.com/engine/reference/run/) command. Normally, the default options in the dockerfile are sufficient to start the application.

If the application does not start, or an error occurs, it is necessary to change the dockerfile and recreate the image.

Once your image has been created and tagged, you can now push it to the hub, after logging in:
- https://docs.docker.com/engine/reference/commandline/login/
- https://docs.docker.com/engine/reference/commandline/push/

> ⚠️ **WARNING**: Create a file named 5.1 with the url of your public Docker hub repo containing your image