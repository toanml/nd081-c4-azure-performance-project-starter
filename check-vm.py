
import azure.mgmt.compute
from azure.identity import DefaultAzureCredential
from azure.mgmt.compute import ComputeManagementClient

# Define your Azure subscription ID and resource group
subscription_id = 'your_subscription_id'
resource_group_name = 'your_resource_group_name'
vm_name = 'your_vm_name'

# Create a compute management client
credential = DefaultAzureCredential()
compute_client = ComputeManagementClient(credential, subscription_id)

# Get the VM instance
vm = compute_client.virtual_machines.get(resource_group_name, vm_name)

# Check the VM status
if vm.instance_view.statuses[1].code == 'PowerState/deallocated':
    print(f'The VM {vm_name} is stopped. Starting the VM...')
    compute_client.virtual_machines.start(resource_group_name, vm_name)
    print(f'The VM {vm_name} has been started.')
else:
    print(f'The VM {vm_name} is already running.')