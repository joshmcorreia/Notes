# AWS Subnets
[Subnets for your VPC - Amazon](https://docs.aws.amazon.com/vpc/latest/userguide/configure-subnets.html)

## What is a subnet?
[Source](https://www.cloudflare.com/learning/network-layer/what-is-a-subnet/)
> A subnet, or subnetwork, is a network inside a network. Subnets make networks more efficient. Through subnetting, network traffic can travel a shorter distance without passing through unnecessary routers to reach its destination.

## Subnet types
[Subnet types](https://docs.aws.amazon.com/vpc/latest/userguide/configure-subnets.html)
- Public subnet: The subnet has a direct route to an internet gateway. Resources in a public subnet can access the public internet.
- Private subnet: The subnet does not have a direct route to an internet gateway. Resources in a private subnet require a NAT device to access the public internet.
- VPN-only subnet: The subnet has a route to a Site-to-Site VPN connection through a virtual private gateway. The subnet does not have a route to an internet gateway.

## Subnet sizing
[Subnet sizing](https://docs.aws.amazon.com/vpc/latest/userguide/configure-subnets.html)

The first four IP addresses and the last IP address in each subnet CIDR block are not available for your use, and they cannot be assigned to a resource, such as an EC2 instance. For example, in a subnet with CIDR block 10.0.0.0/24, the following five IP addresses are reserved:
- 10.0.0.0: Network address.
- 10.0.0.1: Reserved by AWS for the VPC router.
- 10.0.0.2: Reserved by AWS. The IP address of the DNS server is the base of the VPC network range plus two. For VPCs with multiple CIDR blocks, the IP address of the DNS server is located in the primary CIDR. We also reserve the base of each subnet range plus two for all CIDR blocks in the VPC. For more information, see Amazon DNS server.
- 10.0.0.3: Reserved by AWS for future use.
- 10.0.0.255: Network broadcast address. We do not support broadcast in a VPC, therefore we reserve this address.

## Subnet routing
[Subnet routing](https://docs.aws.amazon.com/vpc/latest/userguide/configure-subnets.html)
> Each subnet must be associated with a route table, which specifies the allowed routes for outbound traffic leaving the subnet. Every subnet that you create is automatically associated with the main route table for the VPC.
