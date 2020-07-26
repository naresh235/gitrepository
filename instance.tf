resource "aws_instance" "i1"
{
  ami="ami-01e074f40dfb9999d"
  instance_type="t2.micro"
  availability_zone="ap-south-1a"
  tags=
  {
    "Name"="Myi1"
	"Appl"="Loan"
	"Owner"="IntelliQ"
  }
}
resource "aws_instance" "i2"
{
  ami="ami-01e074f40dfb9999d"
  instance_type="t2.small"
  availability_zone="ap-south-1a"
}
resource "aws_eip" "myeip"
{
   instance="${aws_instance.i1.id}"
}
output "myid"
{
  value="${aws_instance.i1.id}"
}
output "myi2pubip"
{
  value="${aws_instance.i2.public_ip}"
}
output "myi2prvip"
{
  value="${aws_instance.i1.private_ip}"
}