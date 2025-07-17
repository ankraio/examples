output "firewall_rule_name" {
  description = "The name of the SSH firewall rule."
  value       = google_compute_firewall.ssh_rule.name
}
