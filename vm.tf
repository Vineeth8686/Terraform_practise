resource "aws_instance" "web" {
  count = var.env == "dev" ? 2 : 1
  ami           = var.imagename
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = element(aws_subnet.public.*.id,count.index)
  vpc_security_group_ids  = ["${aws_security_group.allow_all.id}",]
  associate_public_ip_address  = true
  #availability_zone = element(var.availability_zone,count.index)
  tags = {
    Name = "${var.vpc_name}-Public-Server-${count.index+1}"
    Env=var.env
    Owner=upper(var.owner_name) 
    CostCenter = "8080"
  }
   # Root device details
  root_block_device {
    delete_on_termination = true
    encrypted = true
    volume_size = "8"
    volume_type ="gp2"

  }

  # #ebs_block_device
  # ebs_block_device {
  #   device_name = "/dev/xvda"
  #   delete_on_termination = true
  #   encrypted = true
  #   volume_size = "2"
  #   volume_type ="gp2"

  # }
  #  lifecycle {
  #   prevent_destroy = false
  # }
   user_data = <<-EOF
		#!/bin/bash
    sudo apt-get update
		sudo apt-get install -y nginx
		sudo systemctl start nginx
		sudo systemctl enable nginx
		echo "<h1>Deployed via Terraform</h1>" | sudo tee -a /var/www/html/index.nginx-debian.html
    echo "<h1>${var.vpc_name}-Public-Server-${count.index}</h1>" | sudo tee -a /var/www/html/index.nginx-debian.html
	EOF
}
