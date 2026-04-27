# Optimizations and Performance - Session 1 - Demo 1: Terraform Core Mechanics

This demo introduces **Infrastructure as Code (IaC)** and the **basic Terraform workflow** used throughout the *Optimizations and Performance* course.

## What students learn

- What IaC is and why it matters
- How Terraform defines desired infrastructure state
- The standard Terraform lifecycle:
    - `init` → `fmt`/`validate` → `plan` → `apply` → inspect `state` → update → re-`plan`

## What to do with these files

Use this folder to practice the first complete Terraform cycle with a simple AWS resource (for example, an S3 bucket).

### Suggested files

- `provider.tf` — Terraform + AWS provider configuration and version constraints
- `main.tf` — first resource definition (`aws_s3_bucket`)

## Basic Terraform cycle

```bash
# 1) Initialize project and download provider plugins
terraform init

# 2) Format and validate configuration
terraform fmt
terraform validate

# 3) Preview infrastructure changes
terraform plan

# 4) Apply changes and create resources
terraform apply

# 5) Inspect Terraform state
cat terraform.tfstate
# or
terraform show

# 6) Make a small change (e.g., add a tag), then plan again
terraform plan
```

## Expected outcomes

By the end of this demo, students should be able to:

1. Write a minimal Terraform configuration
2. Run the Terraform CLI workflow correctly
3. Understand how Terraform tracks infrastructure in state
4. Observe how configuration updates are reflected in plans

## Notes

- Keep credentials configured locally (for example, AWS CLI profile or environment variables).
- Avoid committing `terraform.tfstate` in real projects unless using a remote backend strategy.
- Clean up resources when done:

```bash
terraform destroy
```

### Note on `.gitignore`

This project includes a [`.gitignore`](.gitignore) file that excludes key Terraform artifacts from version control:
- `.terraform/` — local provider plugins downloaded by `terraform init` (large, machine-specific)
- `.terraform.lock.hcl` — provider lock file (can be committed, but often excluded in demos)
- `*.tfstate` / `*.tfstate.backup` — state files may contain **sensitive resource data** and should never be committed unless using a remote backend 
