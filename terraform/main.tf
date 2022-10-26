resource "aws_instance" "my_instance" {
  ### EDIT HERE !

  ### DO NOT EDIT BELOW !!
  count         = 1
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  ### DO NOT EDIT ABOVE !!
}

resource "aws_key_pair" "my_kp" {
  ### EDIT HERE !
}

resource "aws_vpc" "my_vpc" {
  ### EDIT HERE !
}

resource "aws_subnet" "my_sn" {
  ### EDIT HERE !
}

resource "aws_internet_gateway" "my_igw" {
  ### EDIT HERE !
}

resource "aws_route_table" "my_rt" {
  ### EDIT HERE !
}

resource "aws_route_table_association" "my_rta" {
  ### EDIT HERE !
}

resource "aws_security_group" "my_sg" {
  ### EDIT HERE !
}

### DO NOT EDIT BELOW !!
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
