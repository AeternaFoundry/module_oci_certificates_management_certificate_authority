output "certificates_management_certificate_authorities_id" {
  description = "Map of id values across all certificates_management_certificate_authorities, keyed the same as var.certificates_management_certificate_authorities except keys with no id are omitted"
  value       = { for k, v in oci_certificates_management_certificate_authority.certificates_management_certificate_authorities : k => v.id if v.id != null && length(v.id) > 0 }
}
output "certificates_management_certificate_authorities_certificate_authority_config" {
  description = "Map of certificate_authority_config values across all certificates_management_certificate_authorities, keyed the same as var.certificates_management_certificate_authorities except keys with no certificate_authority_config are omitted"
  value       = { for k, v in oci_certificates_management_certificate_authority.certificates_management_certificate_authorities : k => one(v.certificate_authority_config) if v.certificate_authority_config != null && length(v.certificate_authority_config) > 0 }
}
output "certificates_management_certificate_authorities_certificate_authority_rules" {
  description = "Map of certificate_authority_rules values across all certificates_management_certificate_authorities, keyed the same as var.certificates_management_certificate_authorities except keys with no certificate_authority_rules are omitted"
  value       = { for k, v in oci_certificates_management_certificate_authority.certificates_management_certificate_authorities : k => v.certificate_authority_rules if v.certificate_authority_rules != null && length(v.certificate_authority_rules) > 0 }
}
output "certificates_management_certificate_authorities_certificate_revocation_list_details" {
  description = "Map of certificate_revocation_list_details values across all certificates_management_certificate_authorities, keyed the same as var.certificates_management_certificate_authorities except keys with no certificate_revocation_list_details are omitted"
  value       = { for k, v in oci_certificates_management_certificate_authority.certificates_management_certificate_authorities : k => one(v.certificate_revocation_list_details) if v.certificate_revocation_list_details != null && length(v.certificate_revocation_list_details) > 0 }
}
output "certificates_management_certificate_authorities_compartment_id" {
  description = "Map of compartment_id values across all certificates_management_certificate_authorities, keyed the same as var.certificates_management_certificate_authorities except keys with no compartment_id are omitted"
  value       = { for k, v in oci_certificates_management_certificate_authority.certificates_management_certificate_authorities : k => v.compartment_id if v.compartment_id != null && length(v.compartment_id) > 0 }
}
output "certificates_management_certificate_authorities_config_type" {
  description = "Map of config_type values across all certificates_management_certificate_authorities, keyed the same as var.certificates_management_certificate_authorities except keys with no config_type are omitted"
  value       = { for k, v in oci_certificates_management_certificate_authority.certificates_management_certificate_authorities : k => v.config_type if v.config_type != null && length(v.config_type) > 0 }
}
output "certificates_management_certificate_authorities_current_version" {
  description = "Map of current_version values across all certificates_management_certificate_authorities, keyed the same as var.certificates_management_certificate_authorities except keys with no current_version are omitted"
  value       = { for k, v in oci_certificates_management_certificate_authority.certificates_management_certificate_authorities : k => v.current_version if v.current_version != null && length(v.current_version) > 0 }
}
output "certificates_management_certificate_authorities_defined_tags" {
  description = "Map of defined_tags values across all certificates_management_certificate_authorities, keyed the same as var.certificates_management_certificate_authorities except keys with no defined_tags are omitted"
  value       = { for k, v in oci_certificates_management_certificate_authority.certificates_management_certificate_authorities : k => v.defined_tags if v.defined_tags != null && length(v.defined_tags) > 0 }
}
output "certificates_management_certificate_authorities_description" {
  description = "Map of description values across all certificates_management_certificate_authorities, keyed the same as var.certificates_management_certificate_authorities except keys with no description are omitted"
  value       = { for k, v in oci_certificates_management_certificate_authority.certificates_management_certificate_authorities : k => v.description if v.description != null && length(v.description) > 0 }
}
output "certificates_management_certificate_authorities_external_key_description" {
  description = "Map of external_key_description values across all certificates_management_certificate_authorities, keyed the same as var.certificates_management_certificate_authorities except keys with no external_key_description are omitted"
  value       = { for k, v in oci_certificates_management_certificate_authority.certificates_management_certificate_authorities : k => v.external_key_description if v.external_key_description != null && length(v.external_key_description) > 0 }
}
output "certificates_management_certificate_authorities_freeform_tags" {
  description = "Map of freeform_tags values across all certificates_management_certificate_authorities, keyed the same as var.certificates_management_certificate_authorities except keys with no freeform_tags are omitted"
  value       = { for k, v in oci_certificates_management_certificate_authority.certificates_management_certificate_authorities : k => v.freeform_tags if v.freeform_tags != null && length(v.freeform_tags) > 0 }
}
output "certificates_management_certificate_authorities_issuer_certificate_authority_id" {
  description = "Map of issuer_certificate_authority_id values across all certificates_management_certificate_authorities, keyed the same as var.certificates_management_certificate_authorities except keys with no issuer_certificate_authority_id are omitted"
  value       = { for k, v in oci_certificates_management_certificate_authority.certificates_management_certificate_authorities : k => v.issuer_certificate_authority_id if v.issuer_certificate_authority_id != null && length(v.issuer_certificate_authority_id) > 0 }
}
output "certificates_management_certificate_authorities_kms_key_id" {
  description = "Map of kms_key_id values across all certificates_management_certificate_authorities, keyed the same as var.certificates_management_certificate_authorities except keys with no kms_key_id are omitted"
  value       = { for k, v in oci_certificates_management_certificate_authority.certificates_management_certificate_authorities : k => v.kms_key_id if v.kms_key_id != null && length(v.kms_key_id) > 0 }
}
output "certificates_management_certificate_authorities_lifecycle_details" {
  description = "Map of lifecycle_details values across all certificates_management_certificate_authorities, keyed the same as var.certificates_management_certificate_authorities except keys with no lifecycle_details are omitted"
  value       = { for k, v in oci_certificates_management_certificate_authority.certificates_management_certificate_authorities : k => v.lifecycle_details if v.lifecycle_details != null && length(v.lifecycle_details) > 0 }
}
output "certificates_management_certificate_authorities_name" {
  description = "Map of name values across all certificates_management_certificate_authorities, keyed the same as var.certificates_management_certificate_authorities except keys with no name are omitted"
  value       = { for k, v in oci_certificates_management_certificate_authority.certificates_management_certificate_authorities : k => v.name if v.name != null && length(v.name) > 0 }
}
output "certificates_management_certificate_authorities_signing_algorithm" {
  description = "Map of signing_algorithm values across all certificates_management_certificate_authorities, keyed the same as var.certificates_management_certificate_authorities except keys with no signing_algorithm are omitted"
  value       = { for k, v in oci_certificates_management_certificate_authority.certificates_management_certificate_authorities : k => v.signing_algorithm if v.signing_algorithm != null && length(v.signing_algorithm) > 0 }
}
output "certificates_management_certificate_authorities_state" {
  description = "Map of state values across all certificates_management_certificate_authorities, keyed the same as var.certificates_management_certificate_authorities except keys with no state are omitted"
  value       = { for k, v in oci_certificates_management_certificate_authority.certificates_management_certificate_authorities : k => v.state if v.state != null && length(v.state) > 0 }
}
output "certificates_management_certificate_authorities_subject" {
  description = "Map of subject values across all certificates_management_certificate_authorities, keyed the same as var.certificates_management_certificate_authorities except keys with no subject are omitted"
  value       = { for k, v in oci_certificates_management_certificate_authority.certificates_management_certificate_authorities : k => v.subject if v.subject != null && length(v.subject) > 0 }
}
output "certificates_management_certificate_authorities_time_created" {
  description = "Map of time_created values across all certificates_management_certificate_authorities, keyed the same as var.certificates_management_certificate_authorities except keys with no time_created are omitted"
  value       = { for k, v in oci_certificates_management_certificate_authority.certificates_management_certificate_authorities : k => v.time_created if v.time_created != null && length(v.time_created) > 0 }
}
output "certificates_management_certificate_authorities_time_of_deletion" {
  description = "Map of time_of_deletion values across all certificates_management_certificate_authorities, keyed the same as var.certificates_management_certificate_authorities except keys with no time_of_deletion are omitted"
  value       = { for k, v in oci_certificates_management_certificate_authority.certificates_management_certificate_authorities : k => v.time_of_deletion if v.time_of_deletion != null && length(v.time_of_deletion) > 0 }
}

