# Terraform Azure AKS Example

This folder contains a Terraform module that create Storage account and its components in [Azure](https://azure.microsoft.com/) and also have Terratest to write automated tests for your Azure Terraform code.

**WARNING**: This module and the automated tests for it deploy real resources into your Azure account which can cost you money.

## Prerequisite: Setup Azure CLI access
1. Sign up for [Azure](https://azure.microsoft.com/).
1. Install [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
1. Install [Terraform](https://www.terraform.io/) and make sure it's on your `PATH`.
1. Login to Azure on the CLI with `az login` or `az login --use-device`, and then configure the CLI.

## Running this module manually
1. Create [Service Principal](https://docs.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli?view=azure-cli-latest) then set the value to the environment variables.
2. You can update the variables in variables.tfvars file and pass it using -var-file or pass the variables value directly to cli.
3. Run `terraform init`
4. Run `terraform apply`
5. Check your resources on [azure-portal](https://portal.azure.com/).
6. When you're done, run `terraform destroy`.


## Running automated tests against this module
1. Create [Service Principal](https://docs.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli?view=azure-cli-latest) then set the value to the environment variables.
2. Install [Golang](https://golang.org/) version `1.13+` required.
3. `cd test`
4. To run the test case update the subscription-id in test file.
5. `go test -v -timeout 60m -tags azure_rgstorage_test.go -run TestTerraformStorageAccountCreation`

### Example

```bash
$ az login 
$ export ARM_SUBSCRIPTION_ID={YOUR_SUBSCRIPTION_ID} 
$ export TF_VAR_client_id={YOUR_SERVICE_PRINCIPAL_APP_ID}
$ export TF_VAR_client_secret={YOUR_SERVICE_PRINCIPAL_PASSWORD}
$ cd test
$ go test -v -timeout 60m -tags azure_aks_test.go -run TestTerraformStorageAccountCreation
```
