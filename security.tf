resource "aws_security_group" "instance_security_group" {
  name   = "aws-${var.environment}-${var.hostname}-sg"
  vpc_id = "${var.vpc_id}"
}

resource "aws_security_group_rule" "allow_ssh" {
  count       = "${var.allow_ssh ? 1 : 0}"
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.instance_security_group.id}"
}

resource "aws_security_group_rule" "allow_http" {
  count       = "${var.allow_http ? 1 : 0}"
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.instance_security_group.id}"
}

resource "aws_security_group_rule" "egress_allow_all" {
  type        = "egress"
  from_port   = 0
  to_port     = 65535
  protocol    = "all"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.instance_security_group.id}"
}
