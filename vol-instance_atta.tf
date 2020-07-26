resource "aws_instance" "mi"
{
  ami="ami-01e074f40dfb9999d"
  instance_type="t2.micro"
  tags=
  {
    "Name"="TestTF"
  }
} 
resource "aws_ebs_volume" "v0"
{
  size=10
  type="gp2"
  availability_zone="${aws_instance.mi.availability_zone}"
  tags=
  {
    "Name"="TestTF-V1"
  }
}
resource "aws_volume_attachment" "va"
{
   instance_id="${aws_instance.mi.id}"
   volume_id="${aws_ebs_volume.v0.id}"
   device_name="/dev/sdf"
} 
