/*data aws_availability_zones "n1"
{
   provider="aws.sing"
}

output "sinfazsname"
{
  value="${data.aws_availability_zones.n1.*.names}"
}
*/