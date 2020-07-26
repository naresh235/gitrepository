/*
  Write Tf scripts to create volumes in each Az of 
  the region
*/
data aws_availability_zones "n1"
{
  
}
output "len"
{
  value="${length(data.aws_availability_zones.n1.names)}"
}