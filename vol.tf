resource "aws_ebs_volume" "v1"
{
  availability_zone="ap-south-1a"
  size="10"
  type="gp2"
}
resource "aws_ebs_volume" "v2"
{
    availability_zone="ap-south-1b"
  size="8"
  type="gp2"
}