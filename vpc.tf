/*resource aws_vpc "v1"
{
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "TFVPC"
  }
}
resource aws_subnet "sn1"
{
    cidr_block="10.0.0.0/24"
	vpc_id ="${aws_vpc.v1.id}"
	map_public_ip_on_launch=true
	availability_zone="ap-south-1a"
	tags = {
    Name = "TFSN1"
  }
}
resource aws_subnet "sn2"
{
    cidr_block="10.0.0.0/24"
	vpc_id ="${aws_vpc.v1.id}"
	tags = {
    Name = "TFSN2"
  }
}
resource aws_internet_gateway "igw"
{
    vpc_id ="${aws_vpc.v1.id}"
}
resource aws_route_table "rtsn1"
{
   vpc_id ="${aws_vpc.v1.id}"
   tags = {
    Name = "RT1SN1"
  }
}
resource aws_route "addigw"
{
   route_table_id ="${aws_route_table.rtsn1.id}"
   destination_cidr_block ="0.0.0.0/0"
   gateway_id="${aws_internet_gateway.igw.id}"
   
}
resource aws_route_table_association "sn1rtAss"
{
   subnet_id ="${aws_subnet.sn1.id}"
   route_table_id ="${aws_route_table.rtsn1.id}"
}
resource aws_eip "myeip"

resource aws_nat_gateway "mynat"
{
  subnet_id="${aws_subnet.sn1.id}"
  allocation_id ="${aws_eip.myeip.id}"
}
resource aws_route_table "rtsn2"
{
   vpc_id ="${aws_vpc.v1.id}"
   tags = {
    Name = "RT2SN2"
  }
 
}
resource aws_route "addnat"
{
   route_table_id ="${aws_route_table.rtsn2.id}"
   destination_cidr_block ="0.0.0.0/0"
   nat_gateway_id ="${aws_nat_gateway.mynat.id}"
}
resource aws_route_table_association "sn2rtAss"
{
   subnet_id ="${aws_subnet.sn2.id}"
   route_table_id ="${aws_route_table.rtsn2.id}"
}
resource aws_instance "i1"
{
   ami="ami-0927ed83617754711"
   instance_type="t2.micro"
   subnet_id="${aws_subnet.sn1.id}"
   user_data="${file("./1.sh")}"
}
*/