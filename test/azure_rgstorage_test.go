package test

import (
    "fmt"
    "strings"
    "testing"

    "github.com/gruntwork-io/terratest/modules/azure"
    "github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformStorageAccountCreation(t *testing.T) {
    t.Parallel()
    subscriptionID := ""
    uniquePostfix := random.UniqueId()
	// retryable errors in terraform testing.
	terraformOptions := &terraform.Options{
    		// The path to where our Terraform code is located
    		TerraformDir: "../",

    		// Variables to pass to our Terraform code using -var options
    		Vars: map[string]interface{}{
    			"postfix": strings.ToLower(uniquePostfix),
    		},
    	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	resourceGroupName := terraform.Output(t, terraformOptions, "resource_group_name")
    storageAccountName := terraform.Output(t, terraformOptions, "storage_account_name")
    storageAccountTier := terraform.Output(t, terraformOptions, "storage_account_account_tier")
    storageAccountKind := terraform.Output(t, terraformOptions, "storage_account_account_kind")
    storageBlobContainerName := terraform.Output(t, terraformOptions, "storage_container_name")

        t.Run("TestStorageAccountExistOrNot", func(t *testing.T) {
                storageAccountExists := azure.StorageAccountExists(t, storageAccountName, resourceGroupName, subscriptionID)
                assert.True(t, storageAccountExists, "storage account does not exist")
            })

        t.Run("TestContainerExistOrNot", func(t *testing.T) {
                    containerExists := azure.StorageBlobContainerExists(t, storageBlobContainerName, storageAccountName, resourceGroupName, subscriptionID)
                     assert.True(t, containerExists, "storage container does not exist")
                })

        t.Run("TestContainerPublicallyAccessibleOrNot", func(t *testing.T) {
                            publicAccess := azure.GetStorageBlobContainerPublicAccess(t, storageBlobContainerName, storageAccountName, resourceGroupName, subscriptionID)
                            assert.False(t, publicAccess, "storage container has public access")
                        })

        t.Run("TestStorageAccountKindMatchOrNot", func(t *testing.T) {
                             accountKind := azure.GetStorageAccountKind(t, storageAccountName, resourceGroupName, subscriptionID)
                             assert.Equal(t, storageAccountKind, accountKind, "storage account kind mismatch")
                        })

        t.Run("TestStorageAccountSkuTierMatchOrNot", func(t *testing.T) {
                              skuTier := azure.GetStorageAccountSkuTier(t, storageAccountName, resourceGroupName, subscriptionID)
                              assert.Equal(t, storageAccountTier, skuTier, "sku tier mismatch")
                         })

        t.Run("TestStorageAccountSkuTierMatchOrNot", func(t *testing.T) {
                              actualDNSString := azure.GetStorageDNSString(t, storageAccountName, resourceGroupName, subscriptionID)
                              storageSuffix, _ := azure.GetStorageURISuffixE()
                              expectedDNS := fmt.Sprintf("https://%s.blob.%s/", storageAccountName, storageSuffix)
                              assert.Equal(t, expectedDNS, actualDNSString, "Storage DNS string mismatch")
                         })

}