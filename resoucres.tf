resource "aws_instance" "wb" {
   ami  = "${var.ami}"
   instance_type = "t1.micro"
   subnet_id = "${aws_subnet.public-subnet.id}"
   vpc_security_group_ids = ["${aws_security_group.sgweb.id}"]
   associate_public_ip_address = true
   source_dest_check = false

  tags = {
    Name = "webserver"
  }
}

# Define database inside the private subnet
resource "aws_instance" "db" {
   ami  = "${var.ami}"
   instance_type = "t1.micro"
   subnet_id = "${aws_subnet.private-subnet.id}"
   vpc_security_group_ids = ["${aws_security_group.sgdb.id}"]
   source_dest_check = false

  tags = {
    Name = "database"
  }
}

resource "aws_s3_bucket" "sand123" {
  bucket = "${var.tag_bucket_name}"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name = var.tag_bucket_name
  }
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id       = "${aws_vpc.default.id}"
  service_name = "com.amazonaws.us-east-1.s3"

  tags = {
    Environment = "test"
 }
}
