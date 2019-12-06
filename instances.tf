data "local_file" "ssh_key" {
  filename = pathexpand("~/.ssh/id_rsa.pub")
}


resource "aws_key_pair" "access_key" {
  key_name = "JRkey.key"
  public_key = data.local_file.ssh_key.content
}

resource "aws_instance" "TFpacker-httpd" {
  ami = "ami-01a477af2acf34416"
  instance_type = "t2.micro"
  key_name = aws_key_pair.access_key.key_name
  monitoring = false

  associate_public_ip_address = true

  tags = {
    Name = "TestServer-with-HTTPD-JR"
    Purpose = "Terraform and Packer test"
  }




}



output "instance_ip" {
  value = "${aws_instance.TFpacker-httpd.*.public_ip}"
}

