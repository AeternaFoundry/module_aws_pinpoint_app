variable "pinpoint_apps" {
  description = <<EOT
Map of pinpoint_apps, attributes below
Optional:
    - name
    - name_prefix
    - region
    - tags
    - tags_all
    - campaign_hook (block):
        - lambda_function_name (optional)
        - mode (optional)
        - web_url (optional)
    - limits (block):
        - daily (optional)
        - maximum_duration (optional)
        - messages_per_second (optional)
        - total (optional)
    - quiet_time (block):
        - end (optional)
        - start (optional)
EOT

  type = map(object({
    name        = optional(string)
    name_prefix = optional(string)
    region      = optional(string)
    tags        = optional(map(string))
    tags_all    = optional(map(string))
    campaign_hook = optional(object({
      lambda_function_name = optional(string)
      mode                 = optional(string)
      web_url              = optional(string)
    }))
    limits = optional(object({
      daily               = optional(number)
      maximum_duration    = optional(number)
      messages_per_second = optional(number)
      total               = optional(number)
    }))
    quiet_time = optional(object({
      end   = optional(string)
      start = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.pinpoint_apps : (
        v.limits == null || (v.limits.daily == null || (v.limits.daily >= 0 && v.limits.daily <= 100))
      )
    ])
    error_message = "must be between 0 and 100"
  }
  validation {
    condition = alltrue([
      for k, v in var.pinpoint_apps : (
        v.limits == null || (v.limits.maximum_duration == null || (v.limits.maximum_duration >= 60))
      )
    ])
    error_message = "must be at least 60"
  }
  validation {
    condition = alltrue([
      for k, v in var.pinpoint_apps : (
        v.limits == null || (v.limits.messages_per_second == null || (v.limits.messages_per_second >= 1 && v.limits.messages_per_second <= 20000))
      )
    ])
    error_message = "must be between 1 and 20000"
  }
  validation {
    condition = alltrue([
      for k, v in var.pinpoint_apps : (
        v.limits == null || (v.limits.total == null || (v.limits.total >= 0 && v.limits.total <= 100))
      )
    ])
    error_message = "must be between 0 and 100"
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

