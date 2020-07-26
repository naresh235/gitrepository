/* Read and print list of AZs from a region*/
/*
data aws_availability_zones "laz"
{
}
output "azlist"
{
  value="${data.aws_availability_zones.laz.*.zone_ids}"
}
output "azlistname"
{
  value="${data.aws_availability_zones.laz.*.names}"
}

*/