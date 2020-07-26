data aws_subnet_ids "s1"
{
   provider ="aws.sing"
   vpc_id ="vpc-0375a4006cb7b403c"
}
output "snlist"
{
   value= "${data.aws_subnet_ids.s1.ids}"
}