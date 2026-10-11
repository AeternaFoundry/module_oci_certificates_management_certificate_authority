resource "oci_certificates_management_certificate_authority" "certificates_management_certificate_authorities" {
  for_each = var.certificates_management_certificate_authorities

  compartment_id           = each.value.compartment_id
  name                     = each.value.name
  defined_tags             = each.value.defined_tags
  description              = each.value.description
  external_key_description = each.value.external_key_description
  freeform_tags            = each.value.freeform_tags
  kms_key_id               = each.value.kms_key_id

  certificate_authority_config {
    dynamic "action_details" {
      for_each = each.value.certificate_authority_config.action_details != null ? [each.value.certificate_authority_config.action_details] : []
      content {
        action_type     = action_details.value.action_type
        certificate_pem = action_details.value.certificate_pem
      }
    }
    certificate_pem                 = each.value.certificate_authority_config.certificate_pem
    config_type                     = each.value.certificate_authority_config.config_type
    issuer_certificate_authority_id = each.value.certificate_authority_config.issuer_certificate_authority_id
    signing_algorithm               = each.value.certificate_authority_config.signing_algorithm
    dynamic "subject" {
      for_each = each.value.certificate_authority_config.subject != null ? [each.value.certificate_authority_config.subject] : []
      content {
        common_name                  = subject.value.common_name
        country                      = subject.value.country
        distinguished_name_qualifier = subject.value.distinguished_name_qualifier
        domain_component             = subject.value.domain_component
        generation_qualifier         = subject.value.generation_qualifier
        given_name                   = subject.value.given_name
        initials                     = subject.value.initials
        locality_name                = subject.value.locality_name
        organization                 = subject.value.organization
        organizational_unit          = subject.value.organizational_unit
        pseudonym                    = subject.value.pseudonym
        serial_number                = subject.value.serial_number
        state_or_province_name       = subject.value.state_or_province_name
        street                       = subject.value.street
        surname                      = subject.value.surname
        title                        = subject.value.title
        user_id                      = subject.value.user_id
      }
    }
    dynamic "validity" {
      for_each = each.value.certificate_authority_config.validity != null ? [each.value.certificate_authority_config.validity] : []
      content {
        time_of_validity_not_after  = validity.value.time_of_validity_not_after
        time_of_validity_not_before = validity.value.time_of_validity_not_before
      }
    }
    version_name = each.value.certificate_authority_config.version_name
  }

  dynamic "certificate_authority_rules" {
    for_each = each.value.certificate_authority_rules != null ? each.value.certificate_authority_rules : []
    content {
      certificate_authority_max_validity_duration = certificate_authority_rules.value.certificate_authority_max_validity_duration
      leaf_certificate_max_validity_duration      = certificate_authority_rules.value.leaf_certificate_max_validity_duration
      dynamic "name_constraint" {
        for_each = certificate_authority_rules.value.name_constraint != null ? [certificate_authority_rules.value.name_constraint] : []
        content {
          dynamic "excluded_subtree" {
            for_each = name_constraint.value.excluded_subtree != null ? name_constraint.value.excluded_subtree : []
            content {
              type  = excluded_subtree.value.type
              value = excluded_subtree.value.value
            }
          }
          dynamic "permitted_subtree" {
            for_each = name_constraint.value.permitted_subtree != null ? name_constraint.value.permitted_subtree : []
            content {
              type  = permitted_subtree.value.type
              value = permitted_subtree.value.value
            }
          }
        }
      }
      path_length_constraint = certificate_authority_rules.value.path_length_constraint
      rule_type              = certificate_authority_rules.value.rule_type
    }
  }

  dynamic "certificate_revocation_list_details" {
    for_each = each.value.certificate_revocation_list_details != null ? [each.value.certificate_revocation_list_details] : []
    content {
      custom_formatted_urls = certificate_revocation_list_details.value.custom_formatted_urls
      object_storage_config {
        object_storage_bucket_name        = certificate_revocation_list_details.value.object_storage_config.object_storage_bucket_name
        object_storage_namespace          = certificate_revocation_list_details.value.object_storage_config.object_storage_namespace
        object_storage_object_name_format = certificate_revocation_list_details.value.object_storage_config.object_storage_object_name_format
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

