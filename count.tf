resource aws_ebs_volume "vol1"
{
  count=3
  type="gp2"
  size=10
  availability_zone="ap-south-1a"
}
resource aws_eip "eip0"
{
   count=0
}
