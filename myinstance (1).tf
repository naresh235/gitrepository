resource "aws_instance" "terraform1"
{
ami="ami-0217a85e28e625474"
instance_type="t2.micro"
tags=
{
"Name"="myi1"
}
}
