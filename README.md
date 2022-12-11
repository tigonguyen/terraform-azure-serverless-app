# terraform-azure-serverless-app

## Benifits of centralized IaC
- Naming convention based on each environments workspace
- No manual changes approach and immutable infrastructure: force to use pipeline for infra deployment only.
- Manage resources changes via `state` (Terraform)
- Modules development: Able to deploy specific resoures on each environments

## Terraform vs. ARM templates vs. Bicep
| Features | Terraform | ARM Templates | Bicep |
| --- | --- | --- | --- |
| Naming Convention | YES | YES | YES |
| Modules development | YES | Via Seperated Template Files | YES |
| Management via a desired state | YES | Complicated and Manually | NO |
| Infrastructure targets | Support On-premises Workloads  | Azure Only | Azure Only |
| CLI tools | `terraform` | `az deployment` | `az deployment` or `az bicep` |
| Update current state | [Azure Terrafy](https://github.com/Azure/aztfy) or `terraform import` | YES | YES |
| Community and Support | OK | OK | Quite New Tool |


## Todo
- [x] Modular and multiple tfstate based on workspaces
- [x] Network module
  - [x] Example VNET (1 VNET per environment)
  - [x] Subnets for each functionality
  - [x] Private and service endpoint enabled
- [x] App Insight module
  - [x] 1 Log analytic workspace for entire environment
  - [x] Multiple App Insights
- [ ] Storage Account module
  - [x] Multiple storage accounts
  - [x] Blob services properties
  - [x] Allow access from specified subnets
  - [ ] Backup policy
  - [ ] Private endpoints
- [ ] Appservices and Functions module
- [ ] Keyvault module

## Usage
Update `env_vars.yaml` and `locals.tf` for env_vars declaration. For example:
```
# For Network infra
vnetPrefix: "10.0.0.0/16"
subnetPrefixes:
  storage: "10.0.1.0/24"
  backend: "10.0.2.0/24"
  engine: "10.0.3.0/24"

# For AppInsight infra type
appInsightsNames:
  - "platform"
  - "frontend"
  - "backend"
logAnalyticSKU: "PerGB2018"

# For Storage infra type
storageAccountNames:
  - "pub"
  - "backend"
  - "report"
  - "payment"
```
Use below commands to initialize backends, modules and the specific environment's deployment.
```
terraform init
terraform workspace <new/select> <env>
```
Use below commands to `plan` and `apply` deployments.
```
terraform plan
terraform apply -auto-approve
```

## Author
- **[Thanh, Nguyen-Dinh](https://github.com/tigonguyen)** 