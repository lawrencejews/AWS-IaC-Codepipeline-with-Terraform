# Create a Null Resource and Provisioners
# resource "null_resource" "name" {
#   depends_on = [module.ec2_public]
  
#   # Connection Block for Provisioners to connect to EC2 Instance
#   connection {
#     type     = "ssh"
#     host     = aws_eip.bastion_eip.public_ip    
#     user     = "ec2-user"
#     password = ""
#     private_key = file("private-key/cfn-key-1.pem")
#   }  

# # File Provisioner: Copies the cfn-key-1.pem file to /tmp/cfn-key-1.pem
#   provisioner "file" {
#     source      = "private-key/cfn-key-1.pem"
#     destination = "/tmp/cfn-key-1.pem"
#   }

# # Remote Exec Provisioner: Using remote-exec provisioner fix the private key permissions on Bastion Host
#   provisioner "remote-exec" {
#     inline = [
#       "sudo chmod 400 /tmp/cfn-key-1.pem"
#     ]
#   }
  
# }

# Creation Time Provisioners - By default they are created during resource creations (terraform apply)