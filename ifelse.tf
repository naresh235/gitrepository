/*variable env
{
  type ="string"
}
resource aws_ebs_volume "v1"
{
   availability_zone="ap-south-1a"
   type="gp2"
   size="${var.env=="dev"?10:var.env=="test"?11:12}"
}
*/