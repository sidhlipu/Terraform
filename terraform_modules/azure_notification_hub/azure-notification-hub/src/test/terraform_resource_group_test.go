package test

import (
	"testing"
	//"fmt"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	//"github.com/gruntwork-io/terratest/modules/random"
)

func TestTerraformNotificationHub(t *testing.T) {
    	t.Parallel()
		//resourceGroupName := fmt.Sprintf("%s", random.UniqueId())
		terraformOptions := &terraform.Options{
        /*Vars:  map[string]interface{} {
            "resource_group_name": resourceGroupName,
			"resource_group_location": "westus",
        },
        */
        TerraformDir: "./example",
    }
	//Clean up resources with "terraform destroy" at the end of the test.
	defer terraform.Destroy(t, terraformOptions)

	//Run "terraform init" and "terraform apply". Fail the test if there are any errors.
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the values of output variables and check they have the expected values.
	output := terraform.Output(t, terraformOptions, "notification_hub_id")
	assert.Equal(t, "/subscriptions/07351e10-cea8-48a1-873c-f102bd200319/resourceGroups/sid-test-rg/providers/Microsoft.NotificationHubs/namespaces/sidtestns/notificationHubs/samplenotificationhub", output)
	
	output = terraform.Output(t, terraformOptions, "notification_hub_ns_id")
	assert.Equal(t, "/subscriptions/07351e10-cea8-48a1-873c-f102bd200319/resourceGroups/sid-test-rg/providers/Microsoft.NotificationHubs/namespaces/sidtestns", output)
}
