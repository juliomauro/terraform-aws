resource "aws_instance" "ec2_generic_instance" {
  ami                         = "${var.ami}"
  key_name                    = "${var.key_pair}"
  subnet_id                   = "${element(random_shuffle.subnets.result, 0)}"
  instance_type               = "${var.instance_type}"
  associate_public_ip_address = "${var.attach_eip ? var.attach_eip : var.public_ip}"
  iam_instance_profile        = "${aws_iam_instance_profile.default_instance_profile.id}"

  root_block_device {
    delete_on_termination = true
  }

  vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

  tags {
    Name        = "aws-${var.environment}-${var.hostname}"
    Environment = "${var.environment}"
    Backup      = "${var.backup}"
    Application = "${var.hostname}"
  }

  # provisioner "remote-exec" {
  #    inline = [
  #      "sudo /usr/bin/hostnamectl set-hostname ${var.hostname}.${var.type}.${var.country}-${var.zone}.${var.domain}",
  #      "/usr/sbin/ipa-client-install --domain=${var.type}.${var.country}-${var.zone}.${var.domain} --server=ipaserver01.compute.br-sao-1.cvccorp.cloud  --hostname ${var.hostname}.${var.type}.${var.country}-${var.zone}.${var.domain} --mkhomedir -p ${var.user-ipa} -w ${var.password-ipa} -U",
  #    ]
  #  }
}

resource "aws_eip" "instance_eip" {
  count                     = "${var.attach_eip ? 1 : 0}"
  vpc                       = true
  instance                  = "${aws_instance.ec2_generic_instance.id}"
  associate_with_private_ip = "${aws_instance.ec2_generic_instance.private_ip}"
}
