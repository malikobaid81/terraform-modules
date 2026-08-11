# terraform-modules
The gateway_id inside the aws_route_table resource is not an association—it is a route entry (rule). Breakdown of the Two Blocks aws_route_table (Defines Routing Rules)Terraform route {
  cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.internet_gateway.id
}
This does not link or attach the route table to the Internet Gateway (IGW). It simply creates a rule inside the table that says: "For any traffic destined for the internet (0.0.0.0/0), send it to the IGW as its next hop/target."aws_route_table_association (Defines Who Uses the Table)Terraform resource "aws_route_table_association" "public_subnet_az1_rt_association" {
  subnet_id      = aws_subnet.public_subnet_az1.id
  route_table_id = aws_route_table.public_route_table.id
}
This performs the actual association between the subnet and the route table. It attaches the route table (and all its rules, including the IGW rule) to the subnet so that instances in public_subnet_az1 can reach the internet. 
Summary of Relationships: 
Internet Gateway: Attached to the VPC. 
Route Table: Contains rules (e.g., 0.0.0.0/0 -> IGW). 
Subnet: Associated with the Route Table.
