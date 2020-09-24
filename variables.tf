variable name {
  type        = string
  default     = ""
  description = "(Required) Specifies the name of the trail."
}

variable s3_bucket_name {
  type        = string
  default     = ""
  description = "(Optional) Specifies the name of the S3 bucket designated for publishing log files."
}

variable s3_key_prefix {
  type        = string
  default     = ""
  description = "(Optional) Specifies the S3 key prefix that follows the name of the bucket you have designated for log file delivery."
}


variable include_global_service_events {
  type        = bool
  default     = true
  description = "(Optional) Specifies whether the trail is publishing events from global services such as IAM to the log files. Defaults to true."
}

variable bucket_name {
  type        = string
  default     = ""
  description = "(Required) Specifies the name of the S3 bucket designated for publishing log files."
}


variable cloud_watch_logs_role_arn {
  type        = string
  default     = ""
  description = "(Optional) Specifies the role for the CloudWatch Logs endpoint to assume to write to a user’s log group."
}

variable cloud_watch_logs_group_arn {
  type        = string
  default     = ""
  description = "(Optional) Specifies a log group name using an Amazon Resource Name (ARN), that represents the log group to which CloudTrail logs will be delivered. Note that CloudTrail requires the Log Stream wildcard."
}

variable enable_logging {
  type        = bool
  default     = true
  description = "(Optional) Enables logging for the trail. Defaults to true. Setting this to false will pause logging."
}

variable is_multi_region_trail {
  type        = bool
  default     = false
  description = "(Optional) Specifies whether the trail is created in the current region or in all regions. Defaults to false"
}

variable is_organization_trail {
  type        = bool
  default     = false
  description = "(Optional) Specifies whether the trail is an AWS Organizations trail. Organization trails log events for the master account and all member accounts. Can only be created in the organization master account. Defaults to false."
}

variable sns_topic_name {
  type        = string
  default     = ""
  description = "(Optional) Specifies the name of the Amazon SNS topic defined for notification of log file delivery."
}

variable enable_log_file_validation {
  type        = bool
  default     = false
  description = "(Optional) Specifies whether log file integrity validation is enabled. Defaults to false."
}

variable kms_key_id {
  type        = string
  default     = ""
  description = "(Optional) Specifies the KMS key ARN to use to encrypt the logs delivered by CloudTrail."
}

variable tags {
  type        = map(string)
  default     = {}
  description = "description"
}


# variable events_selector {
#   type        = list(map(any))
#   default     = []
#   description = "Optional) Specifies an event selector for enabling data event logging. Fields documented below. Please note the CloudTrail limits when configuring these."
# }

variable event_selector {
  type = list(object({
    read_write_type           = string
    include_management_events = string
    type                      = string
    values                    = string
  }))
  default = []
}
