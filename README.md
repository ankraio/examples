## Getting Started Automation Samples for Ankra in CD Flows

This repository contains sample configurations and automation scripts to help you get started with integrating [Ankra](https://ankra.io) into your Continuous Delivery (CD) workflows. These examples are designed to demonstrate best practices for automating infrastructure provisioning and management using Terraform, making it easier to adopt Ankra within your CI/CD pipelines.

### What You'll Find Here

- **Terraform Modules & Examples:**
  - Modular and reusable Terraform code for common infrastructure components (GKE, VPC, NAT, Firewall, Compute, etc.).
  - Example environment configurations and state management patterns.
- **CD Integration Guidance:**
  - How to structure your infrastructure-as-code for seamless integration with Ankra and your existing CD tools.
  - Tips for managing secrets, state, and environment-specific variables securely.
- **Best Practices:**
  - Recommendations for organizing your codebase, handling multiple environments, and automating deployments.

### How to Use These Samples

1. **Clone this repository:**
   ```sh
   git clone https://github.com/ankraio/examples.git
   ```
2. **Review the Terraform modules and example configurations** under `terraform/gke/high-compute-cluster/` and its subfolders.
3. **Adapt the samples** to fit your organization's infrastructure and CD pipeline requirements.
4. **Integrate with Ankra:**
   - Use these patterns as a starting point for automating your infrastructure provisioning and management with Ankra in your CD flow.

### Learn More

- [Ankra Documentation](https://docs.ankra.io/)
- [Terraform Documentation](https://www.terraform.io/docs)

---
For questions or support, please reach out via [Ankra Support](https://community.ankra.io/).
