data "aws_iam_policy_document" "instance_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy" "describe_instances" {
  name = "DescribeInstances"
  role = "${aws_iam_role.default_iam_role.id}"

  policy = <<EOF
{
     "Version": "2012-10-17",
     "Statement": [{
        "Effect": "Allow",
        "Action": [
          "ec2:DescribeInstances"
        ],
        "Resource": "*"
      }
     ]
}
EOF
}

resource "aws_iam_role" "default_iam_role" {
  name               = "aws-${var.environment}-${var.hostname}-role"
  assume_role_policy = "${data.aws_iam_policy_document.instance_assume_role_policy.json}"
}

resource "aws_iam_instance_profile" "default_instance_profile" {
  name = "aws-${var.environment}-${var.hostname}-profile"
  role = "${aws_iam_role.default_iam_role.name}"
}
