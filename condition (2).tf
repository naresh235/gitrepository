/*variable env
{
  type="string"
}
resource aws_instance "i2"
{
  ami="ami-0927ed83617754711"
   instance_type="${var.env=="dev"?"t2.micro":"t2.small"}"
}
*/