data "aws_caller_identity" "current" {}



resource "aws_cloudtrail" "trail" {
  name                          = var.name
  s3_bucket_name                = var.s3_bucket_name != "" ? var.s3_bucket_name : var.bucket_name
  s3_key_prefix                 = var.s3_key_prefix
  include_global_service_events = var.include_global_service_events
  cloud_watch_logs_role_arn     = var.cloud_watch_logs_role_arn
  cloud_watch_logs_group_arn    = var.cloud_watch_logs_group_arn
  enable_logging                = var.enable_logging
  is_multi_region_trail         = var.is_multi_region_trail
  is_organization_trail         = var.is_organization_trail
  sns_topic_name                = var.sns_topic_name
  enable_log_file_validation    = var.enable_log_file_validation
  kms_key_id                    = var.kms_key_id

  dynamic "event_selector" {
    for_each = toset(var.event_selector)
    content {

      read_write_type           = event_selector.value["read_write_type"]
      include_management_events = event_selector.value["include_management_events"]

      data_resource {
        type   = event_selector.value["type"]
        values = event_selector.value["values"]

      }
    }
  }

  tags = var.tags



  depends_on = [aws_s3_bucket.bucket]
}

resource "aws_s3_bucket" "bucket" {
  count         = var.s3_bucket_name != "" ? 1 : 0
  bucket        = var.s3_bucket_name #!= "" ?  var.s3_bucket_name : var.bucket_name
  force_destroy = true

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AWSCloudTrailAclCheck",
            "Effect": "Allow",
            "Principal": {
                "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "arn:aws:s3:::${var.s3_bucket_name}"
        },
        {
            "Sid": "AWSCloudTrailAclCheck",
            "Effect": "Allow",
            "Principal": {
                "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::${var.s3_bucket_name}/AWSLogs/${data.aws_caller_identity.current.account_id}/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        }
    ]
}
POLICY
}
