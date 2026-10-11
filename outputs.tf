output "pinpoint_apps_id" {
  description = "Map of id values across all pinpoint_apps, keyed the same as var.pinpoint_apps"
  value       = { for k, v in aws_pinpoint_app.pinpoint_apps : k => v.id if v.id != null && length(v.id) > 0 }
}
output "pinpoint_apps_application_id" {
  description = "Map of application_id values across all pinpoint_apps, keyed the same as var.pinpoint_apps"
  value       = { for k, v in aws_pinpoint_app.pinpoint_apps : k => v.application_id if v.application_id != null && length(v.application_id) > 0 }
}
output "pinpoint_apps_arn" {
  description = "Map of arn values across all pinpoint_apps, keyed the same as var.pinpoint_apps"
  value       = { for k, v in aws_pinpoint_app.pinpoint_apps : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "pinpoint_apps_campaign_hook" {
  description = "Map of campaign_hook values across all pinpoint_apps, keyed the same as var.pinpoint_apps"
  value       = { for k, v in aws_pinpoint_app.pinpoint_apps : k => one(v.campaign_hook) if v.campaign_hook != null && length(v.campaign_hook) > 0 }
}
output "pinpoint_apps_limits" {
  description = "Map of limits values across all pinpoint_apps, keyed the same as var.pinpoint_apps"
  value       = { for k, v in aws_pinpoint_app.pinpoint_apps : k => one(v.limits) if v.limits != null && length(v.limits) > 0 }
}
output "pinpoint_apps_name" {
  description = "Map of name values across all pinpoint_apps, keyed the same as var.pinpoint_apps"
  value       = { for k, v in aws_pinpoint_app.pinpoint_apps : k => v.name if v.name != null && length(v.name) > 0 }
}
output "pinpoint_apps_name_prefix" {
  description = "Map of name_prefix values across all pinpoint_apps, keyed the same as var.pinpoint_apps"
  value       = { for k, v in aws_pinpoint_app.pinpoint_apps : k => v.name_prefix if v.name_prefix != null && length(v.name_prefix) > 0 }
}
output "pinpoint_apps_quiet_time" {
  description = "Map of quiet_time values across all pinpoint_apps, keyed the same as var.pinpoint_apps"
  value       = { for k, v in aws_pinpoint_app.pinpoint_apps : k => one(v.quiet_time) if v.quiet_time != null && length(v.quiet_time) > 0 }
}
output "pinpoint_apps_region" {
  description = "Map of region values across all pinpoint_apps, keyed the same as var.pinpoint_apps"
  value       = { for k, v in aws_pinpoint_app.pinpoint_apps : k => v.region if v.region != null && length(v.region) > 0 }
}
output "pinpoint_apps_tags" {
  description = "Map of tags values across all pinpoint_apps, keyed the same as var.pinpoint_apps"
  value       = { for k, v in aws_pinpoint_app.pinpoint_apps : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "pinpoint_apps_tags_all" {
  description = "Map of tags_all values across all pinpoint_apps, keyed the same as var.pinpoint_apps"
  value       = { for k, v in aws_pinpoint_app.pinpoint_apps : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}

