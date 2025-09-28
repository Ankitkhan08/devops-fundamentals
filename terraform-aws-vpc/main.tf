# This first block configures the AWS Provider, telling Terraform we want to work with AWS
# and setting our default region.
provider "aws" {
  region = "us-east-1"
}

# This block defines our Virtual Private Cloud (VPC). This is the main container for our network.
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16" # This defines the private IP address range for our entire network.

  tags = {
    Name = "devops-fundamentals-vpc"
  }
}

# This defines a Subnet. A subnet is a smaller section of our VPC where we can place resources.
# This will be our "public" subnet.
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id # This connects the subnet to the VPC we just defined above.
  cidr_block = "10.0.1.0/24"   # The IP address range for this specific subnet.

  tags = {
    Name = "devops-public-subnet"
  }
}

# This defines an Internet Gateway. This is the "front door" of our VPC that allows
# traffic to go to and from the public internet.
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "devops-igw"
  }
}

# This defines a Route Table. This is the "road map" or "GPS" for our network.
# It tells network traffic where to go.
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  # This "route" rule says that any traffic destined for the public internet (0.0.0.0/0)
  # should be sent to our Internet Gateway.
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "devops-public-rt"
  }
}

# This final block associates our public subnet with our public route table,
# effectively connecting the zone to the road map.
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}
