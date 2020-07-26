/*resource aws_ebs_volume "v1"
{
   count=2
   availability_zone="ap-south-1a"
   type="gp2"
   size=10
}
output "vids"
{
  value="${aws_ebs_volume.v1.*.id}"
}
output "firstvid"
{
  value="${aws_ebs_volume.v1.*.id[0]}"
}
*/
