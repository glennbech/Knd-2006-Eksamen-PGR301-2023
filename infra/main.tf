resource "aws_apprunner_service" "service" {
  service_name = format("%s-%s",var.candidate_name, var.service_name)

  instance_configuration {
    instance_role_arn = aws_iam_role.role_for_apprunner_service.arn
    cpu = 256
    memory = 1024
  }

  source_configuration {
    authentication_configuration {
      access_role_arn = "arn:aws:iam::244530008913:role/service-role/AppRunnerECRAccessRole"
    }
    image_repository {
      image_configuration {
        port = var.port
      }
      image_identifier      = var.image_identifier
      image_repository_type = "ECR"
    }
    auto_deployments_enabled = true
  }
}

resource "aws_iam_role" "role_for_apprunner_service" {
  name = format("%s-%s",var.candidate_name, var.role_name)
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_policy" "policy" {
  name = format("%s-%s",var.candidate_name, var.policy_name)
  description = "Policy for apprunner instance"
  policy      = data.aws_iam_policy_document.policy.json
}


resource "aws_iam_role_policy_attachment" "attachment" {
  role       = aws_iam_role.role_for_apprunner_service.name
  policy_arn = aws_iam_policy.policy.arn
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["tasks.apprunner.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "policy" {
  statement {
    effect    = "Allow"
    actions   = ["rekognition:*"]
    resources = ["*"]
  }
  
  statement  {
    effect    = "Allow"
    actions   = ["s3:*"]
    resources = ["*"]
  }

  statement  {
    effect    = "Allow"
    actions   = ["cloudwatch:*"]
    resources = ["*"]
  }
}

resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = format("%s-%s", var.candidate_name, var.dashboard_name)
  dashboard_body = <<DASHBOARD
{
  "widgets": [
    {
      "type": "metric",
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "${var.candidate_name}",
            "image_count.value"
          ],
          [
            "${var.candidate_name}",
            "famousPeopleInBucket.value"
          ],
          [
            "${var.candidate_name}",
            "imagesWithFamousInKey.value"
          ]
        ],
        "view": "gauge",
        "region": "eu-west-1",
        "title": "Bucket stats",
        "stat": "Maximum",
        "yAxis": {
          "left": {
            "min": 0, 
            "max": 100
          }        
        } 
      }
    },
    {
      "type": "metric",
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [ "kandidat2006", "famous.timed.max", "exception", "none", "method", "checkFamousPeople", "class", "com.example.s3rekognition.controller.RekognitionController", { "region": "eu-west-1", "label": "famous max" } ],
          [ ".", "famous.timed.avg", ".", ".", ".", ".", ".", ".", { "region": "eu-west-1", "label": "famous avg" } ],
          [ ".", "ppe.timed.avg", ".", ".", ".", "scanForPPE", ".", ".", { "region": "eu-west-1", "label": "ppe avg" } ],
          [ ".", "ppe.timed.max", ".", ".", ".", ".", ".", ".", { "region": "eu-west-1", "label": "ppe max" } ]
        ],
        "view": "timeSeries",
        "region": "eu-west-1",
        "title": "Avg time of endpoints to finish",
        "stat": "Average",
        "yAxis": {
          "left": {
            "label": "Milliseconds",
            "showUnits": false
          }       
        }
      }
    },
      {
      "type": "metric",
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [ { "expression": "SEARCH('MetricName=\"famous.person.count\" ', 'Maximum')", "label": "", "id": "e1", "region": "eu-west-1" } ]
        ],
        "view": "bar",
        "region": "eu-west-1",
        "title": "Number of times a celebrity har been recognized",
        "stat": "Maximum"
        } 
      }
      
  ]
}
DASHBOARD
}


module "alarm" {
  source = "./alarm_module"
  alarm_email = var.alarm_email
  prefix = var.candidate_name
}










