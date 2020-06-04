provider "aws" {
  region     = "us-east-1"
  access_key = "AKIASYCL2FWCWX24TB4A"
  secret_key = "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"
}

resource "aws_instance" "myweb" {
  ami = data.aws_ami.app_ami.id
  instance_type = lookup(var.instance_type, terraform.workspace)
}



/*

default - t2.nano
dev - t2.micro
prd - t2.large
*/

