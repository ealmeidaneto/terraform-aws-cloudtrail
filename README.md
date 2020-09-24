## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.9 |
| aws | >= 3.0.0 |
| random | >= 2.1 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket\_name | (Required) Specifies the name of the S3 bucket designated for publishing log files. | `string` | `""` | no |
| cloud\_watch\_logs\_group\_arn | (Optional) Specifies a log group name using an Amazon Resource Name (ARN), that represents the log group to which CloudTrail logs will be delivered. Note that CloudTrail requires the Log Stream wildcard. | `string` | `""` | no |
| cloud\_watch\_logs\_role\_arn | (Optional) Specifies the role for the CloudWatch Logs endpoint to assume to write to a user’s log group. | `string` | `""` | no |
| enable\_log\_file\_validation | (Optional) Specifies whether log file integrity validation is enabled. Defaults to false. | `bool` | `false` | no |
| enable\_logging | (Optional) Enables logging for the trail. Defaults to true. Setting this to false will pause logging. | `bool` | `true` | no |
| event\_selector | n/a | <pre>list(object({<br>    read_write_type           = string<br>    include_management_events = string<br>    type                      = string<br>    values                    = string<br>  }))</pre> | `[]` | no |
| include\_global\_service\_events | (Optional) Specifies whether the trail is publishing events from global services such as IAM to the log files. Defaults to true. | `bool` | `true` | no |
| is\_multi\_region\_trail | (Optional) Specifies whether the trail is created in the current region or in all regions. Defaults to false | `bool` | `false` | no |
| is\_organization\_trail | (Optional) Specifies whether the trail is an AWS Organizations trail. Organization trails log events for the master account and all member accounts. Can only be created in the organization master account. Defaults to false. | `bool` | `false` | no |
| kms\_key\_id | (Optional) Specifies the KMS key ARN to use to encrypt the logs delivered by CloudTrail. | `string` | `""` | no |
| name | (Required) Specifies the name of the trail. | `string` | `""` | no |
| s3\_bucket\_name | (Optional) Specifies the name of the S3 bucket designated for publishing log files. | `string` | `""` | no |
| s3\_key\_prefix | (Optional) Specifies the S3 key prefix that follows the name of the bucket you have designated for log file delivery. | `string` | `""` | no |
| sns\_topic\_name | (Optional) Specifies the name of the Amazon SNS topic defined for notification of log file delivery. | `string` | `""` | no |
| tags | description | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The Amazon Resource Name of the trail. |
| home\_region | The region in which the trail was created. |
| id | The name of the trail |
