provider "aws" {
  region  = "{{ region }}"
}

terraform {
  backend "s3" {
    bucket         = "{{ bucket_name }}"
    key            = "state/terraform.tfstate"
    region         = "{{ region }}"
    dynamodb_table = "{{ dynamodb_table }}"
    encrypt        = true
  }
}

resource "aws_instance" "{{ instance_name }}" {
  ami                    = "{{ ami_id }}"
  count			 = "{{ instance_count }}"
  key_name               = "{{ key_name }}"
  instance_type          = "{{ instance_type }}"
  #availability_zone      = "{{ availability_zone }}"
  vpc_security_group_ids = ["{{ sg_id }}"]

  tags = {
    Name = "{{ instance_name }}"
  }
}
