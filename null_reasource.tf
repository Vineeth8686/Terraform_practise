resource "null_resource" "cluster" {
count = var.env == "Dev" || var.env == "dev" ? 1 : 1 
 
 provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"

    connection {
    type     = "ssh"
    user     = "root"
    private_key = "${file("C:\Users\vinee\/.ssh\id_rsa")}"
    host = element(aws_instance.web.*.id, count.index)
  }

  }
#     provisioner "remote-exec" {
#     inline = [
#       "sudo chmod 777 /tmp/script.sh",
#       "sudo /tmp/script.sh"
#     ]
#     connection {
#     type     = "ssh"
#     user     = "root"
#     private_key = file("Jenkins.pem")
#     host = element(aws_instance.web.*.id, count.index)
#   }
#   }

#   provisioner "local-exec" {
#     command = <<EOH
#       echo "${element(aws_instance.web.*.id, count.index)}" >> public_server_details_2,
#     EOH
#   }

}