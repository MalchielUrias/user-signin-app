data "aws_availability_zones" "available" {
    state = "available"
}

resource "aws_vpc" "k8_project_vpc" {
  cidr_block = var.vpc_cidr_block
  enable_dns_hostnames = true

  tags = {
    project: "k8 project"
    Name: "K8_Project_VPC"
  }
}

// Nat Gateway 
resource "aws_nat_gateway" "k8_nat_gateway" {
  allocation_id = aws_eip.k8_nat_eip.id
  subnet_id = aws_subnet.public_sub[0].id

  depends_on = [ aws_internet_gateway.k8_internet_gw, aws_subnet.public_sub, aws_subnet.private_sub, aws_eip.k8_nat_eip ]
}

//Internet Gateway
resource "aws_internet_gateway" "k8_internet_gw" {
  vpc_id = aws_vpc.k8_project_vpc.id
}

# EIP for NAT
resource "aws_eip" "k8_nat_eip" {
  domain        = "vpc"
  depends_on = [aws_internet_gateway.k8_internet_gw]
}

// Public Subnet
resource "aws_subnet" "public_sub" {
  count = var.azone_count
  vpc_id = aws_vpc.k8_project_vpc.id
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  cidr_block = "10.0.${count.index}.0/24"
}

// Route Table
resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.k8_project_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.k8_internet_gw.id 
  }

  depends_on = [ aws_subnet.private_sub, aws_subnet.private_sub ]
}

// Route Table Associations
resource "aws_route_table_association" "pub_rt_association" {
  count = var.azone_count

  subnet_id      = aws_subnet.public_sub[count.index].id
  route_table_id = aws_route_table.pub_rt.id

  depends_on = [ aws_route_table.pub_rt, aws_route_table.pub_rt ]
}

// Private Subnet
resource "aws_subnet" "private_sub" {
  count = var.azone_count
  vpc_id = aws_vpc.k8_project_vpc.id
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  cidr_block = "10.0.${10+count.index}.0/24"
}

// Route Table
resource "aws_route_table" "priv_rt" {
  # count = len(var.private_subnet_cidr_blocks)
  vpc_id = aws_vpc.k8_project_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.k8_nat_gateway.id 
  }

  depends_on = [ aws_subnet.private_sub, aws_subnet.public_sub ]
}

// Route Table Associations
resource "aws_route_table_association" "priv_rt_association" {
  count = var.azone_count

  subnet_id      = aws_subnet.private_sub[count.index].id
  route_table_id = aws_route_table.priv_rt.id

  depends_on = [ aws_route_table.priv_rt, aws_subnet.private_sub ]
}