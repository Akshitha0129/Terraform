resource "aws_vpc" "vpc1" {
  cidr_block = var.cidr
}

resource "aws_subnet" "sub01" {
    vpc_id = aws_vpc.vpc1.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true  
  
}

resource "aws_subnet" "sub02" {
    vpc_id = aws_vpc.vpc1.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = true  
  
}

resource "aws_internet_gateway" "gate" {
    vpc_id = aws_vpc.vpc1.id
}

resource "aws_route_table" "route" {
    vpc_id = aws_vpc.vpc1.id

    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gate.id
   }

}

resource "aws_route_table_association" "rtable1" {
    subnet_id = aws_subnet.sub01.id
    route_table_id = aws_route_table.route.id
}

resource "aws_route_table_association" "rtable2" {
    subnet_id = aws_subnet.sub02.id
    route_table_id = aws_route_table.route.id
}

resource "aws_security_group" "Security" {
  name = "web"
  vpc_id = aws_vpc.vpc1.id

  ingress {
    description = "HTTP from VPC"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web-sg"
  }
}

resource "aws_s3_bucket" "example" {
  bucket = "akshitha799"
}

resource "aws_instance" "instance1" {
  ami = "ami-0866a3c8686eaeeba"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.Security.id]
  subnet_id = aws_subnet.sub01.id
  user_data = base64encode(file("userdata.sh"))
}

resource "aws_instance" "instance2" {
  ami = "ami-0866a3c8686eaeeba"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.Security.id]
  subnet_id = aws_subnet.sub02.id
  user_data = base64encode(file("userdata2.sh"))
}

#create alb
resource "aws_lb" "loadbalancer" {
  name = "loadbalancer"
  internal = false
  load_balancer_type = "application"

  security_groups = [aws_security_group.Security.id]
  subnets = [aws_subnet.sub01.id, aws_subnet.sub02.id]

  tags = {
    Name = "web"
  }
}

resource "aws_lb_target_group" "target" {
  name = "target1"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.vpc1.id

  health_check {
    path = "/"
    port = "traffic-port"
  }
}

resource "aws_lb_target_group_attachment" "attach1" {
  target_group_arn = aws_lb_target_group.target.arn
  target_id = aws_instance.instance1.id
  port = 80
}

resource "aws_lb_target_group_attachment" "attach2" {
  target_group_arn = aws_lb_target_group.target.arn
  target_id = aws_instance.instance2.id
  port = 80
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.loadbalancer.arn
  port = 80
  protocol = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.target.arn
    type = "forward"
  }
}

output "loadbalancerdns" {
  value = aws_lb.loadbalancer.dns_name
}
