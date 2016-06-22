provider "aws" { }

resource "aws_vpc" "vpc" {
  cidr_block = "${var.vpc_cidr}"

  tags {
    "Name" = "${var.vpc_name}"
    "Vpc" = "${var.vpc_name}"
    "Provisioner" = "tf"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    "Name" = "${var.vpc_name}"
    "Vpc" = "${var.vpc_name}"
    "Provisioner" = "tf"
  }
}

output "vpc_name" {
  value = "${var.vpc_name}"
}

output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "vpc_cidr" {
  value = "${var.vpc_cidr}"
}

output "igw_id" {
  value = "${aws_internet_gateway.igw.id}"
}
