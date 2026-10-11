variable "certificates_management_certificate_authorities" {
  description = <<EOT
Map of certificates_management_certificate_authorities, attributes below
Required:
    - compartment_id
    - name
    - certificate_authority_config (block):
        - action_details (optional, block):
            - action_type (optional)
            - certificate_pem (optional)
        - certificate_pem (optional)
        - config_type (required)
        - issuer_certificate_authority_id (optional)
        - signing_algorithm (optional)
        - subject (optional, block):
            - common_name (required)
            - country (optional)
            - distinguished_name_qualifier (optional)
            - domain_component (optional)
            - generation_qualifier (optional)
            - given_name (optional)
            - initials (optional)
            - locality_name (optional)
            - organization (optional)
            - organizational_unit (optional)
            - pseudonym (optional)
            - serial_number (optional)
            - state_or_province_name (optional)
            - street (optional)
            - surname (optional)
            - title (optional)
            - user_id (optional)
        - validity (optional, block):
            - time_of_validity_not_after (required)
            - time_of_validity_not_before (optional)
        - version_name (optional)
Optional:
    - defined_tags
    - description
    - external_key_description
    - freeform_tags
    - kms_key_id
    - certificate_authority_rules (block):
        - certificate_authority_max_validity_duration (optional)
        - leaf_certificate_max_validity_duration (optional)
        - name_constraint (optional, block):
            - excluded_subtree (optional, block):
                - type (optional)
                - value (optional)
            - permitted_subtree (optional, block):
                - type (optional)
                - value (optional)
        - path_length_constraint (optional)
        - rule_type (required)
    - certificate_revocation_list_details (block):
        - custom_formatted_urls (optional)
        - object_storage_config (required, block):
            - object_storage_bucket_name (required)
            - object_storage_namespace (optional)
            - object_storage_object_name_format (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id           = string
    name                     = string
    defined_tags             = optional(map(string))
    description              = optional(string)
    external_key_description = optional(string)
    freeform_tags            = optional(map(string))
    kms_key_id               = optional(string)
    certificate_authority_config = object({
      action_details = optional(object({
        action_type     = optional(string)
        certificate_pem = optional(string)
      }))
      certificate_pem                 = optional(string)
      config_type                     = string
      issuer_certificate_authority_id = optional(string)
      signing_algorithm               = optional(string)
      subject = optional(object({
        common_name                  = string
        country                      = optional(string)
        distinguished_name_qualifier = optional(string)
        domain_component             = optional(string)
        generation_qualifier         = optional(string)
        given_name                   = optional(string)
        initials                     = optional(string)
        locality_name                = optional(string)
        organization                 = optional(string)
        organizational_unit          = optional(string)
        pseudonym                    = optional(string)
        serial_number                = optional(string)
        state_or_province_name       = optional(string)
        street                       = optional(string)
        surname                      = optional(string)
        title                        = optional(string)
        user_id                      = optional(string)
      }))
      validity = optional(object({
        time_of_validity_not_after  = string
        time_of_validity_not_before = optional(string)
      }))
      version_name = optional(string)
    })
    certificate_authority_rules = optional(list(object({
      certificate_authority_max_validity_duration = optional(string)
      leaf_certificate_max_validity_duration      = optional(string)
      name_constraint = optional(object({
        excluded_subtree = optional(list(object({
          type  = optional(string)
          value = optional(string)
        })))
        permitted_subtree = optional(list(object({
          type  = optional(string)
          value = optional(string)
        })))
      }))
      path_length_constraint = optional(number)
      rule_type              = string
    })))
    certificate_revocation_list_details = optional(object({
      custom_formatted_urls = optional(list(string))
      object_storage_config = object({
        object_storage_bucket_name        = string
        object_storage_namespace          = optional(string)
        object_storage_object_name_format = string
      })
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.certificates_management_certificate_authorities : (
        contains([for v in ["ROOT_CA_GENERATED_INTERNALLY", "ROOT_CA_MANAGED_EXTERNALLY", "SUBORDINATE_CA_ISSUED_BY_INTERNAL_CA", "SUBORDINATE_CA_MANAGED_INTERNALLY_ISSUED_BY_EXTERNAL_CA"] : lower(v)], lower(v.certificate_authority_config.config_type))
      )
    ])
    error_message = "must be one of: \"ROOT_CA_GENERATED_INTERNALLY\", \"ROOT_CA_MANAGED_EXTERNALLY\", \"SUBORDINATE_CA_ISSUED_BY_INTERNAL_CA\", \"SUBORDINATE_CA_MANAGED_INTERNALLY_ISSUED_BY_EXTERNAL_CA\""
  }
  validation {
    condition = alltrue([
      for k, v in var.certificates_management_certificate_authorities : (
        v.certificate_authority_config.action_details == null || (v.certificate_authority_config.action_details.action_type == null || (contains([for v in ["GENERATE_CSR", "UPDATE_CERTIFICATE"] : lower(v)], lower(v.certificate_authority_config.action_details.action_type))))
      )
    ])
    error_message = "must be one of: \"GENERATE_CSR\", \"UPDATE_CERTIFICATE\""
  }
  validation {
    condition = alltrue([
      for k, v in var.certificates_management_certificate_authorities : (
        v.certificate_authority_rules == null || alltrue([for item in v.certificate_authority_rules : (contains([for v in ["CERTIFICATE_AUTHORITY_ISSUANCE_EXPIRY_RULE", "CERTIFICATE_AUTHORITY_ISSUANCE_RULE"] : lower(v)], lower(item.rule_type)))])
      )
    ])
    error_message = "must be one of: \"CERTIFICATE_AUTHORITY_ISSUANCE_EXPIRY_RULE\", \"CERTIFICATE_AUTHORITY_ISSUANCE_RULE\""
  }
}

