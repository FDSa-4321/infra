resource "tls_private_key" "awskey" {
 algorithm = "RSA"
}
resource "aws_key_pair" "generated_key" {
 key_name = "awskey"
 public_key = "${tls_private_key.awskey.public_key_openssh}"
 depends_on = [
  tls_private_key.awskey
 ]
}
resource "local_file" "key" {
 content = "${tls_private_key.awskey.private_key_pem}"
 filename = "awskey.pem"
 file_permission ="0400"
 depends_on = [
  tls_private_key.awskey
 ]
}