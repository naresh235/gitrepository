resource aws_security_group "sg1"
{
   name        = "mysgtf"
   description = "mysgtf0"
    ingress
	{
	from_port="22"
	to_port="22"
	protocol    = "tcp"
	cidr_blocks=["20.60.0.0/32","45.89.90.90/32"]
	}
	ingress
	{
	from_port="80"
	to_port="80"
	protocol    = "tcp"
	cidr_blocks=["0.0.0.0/0"]
	}
}
resource aws_instance "i1"
{
   count=2
   ami="ami-0927ed83617754711"
   instance_type="t2.micro"
   vpc_security_group_ids=["${aws_security_group.sg1.id}"]
   user_data="${file("./myscript.sh")}"
   tags=
   {
     "Name"="TF1"
	 "App"="test"
   }
}
resource aws_elb "myelb"
{
    name="tfelb"
	 listener {
    instance_port     = "80"
    instance_protocol = "http"
    lb_port           = "80"
    lb_protocol       = "http"
  }
   health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 10
  }
  security_groups =["${aws_security_group.sg1.id}"]
  instances=["${aws_instance.i1.*.id[0]}"]
  availability_zones=["ap-south-1a","ap-south-1b","ap-south-1c"]
}
output "elbdns"
{
   value="${aws_elb.myelb.dns_name}"
   
}






