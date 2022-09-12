###Authentication with azure###

$login = Connect-AzAccount
$subscriptionid = "" # set default subscription

Select-AzSubscription -Subscription $subscriptionid

$vm_name = "" # provide vm name
$rg_name = "" # provide rg name

$details = Get-AzVM -ResourceGroupName $rg_name -Name $vm_name

$json_data = $details | ConvertTo-Json

$json_data

#for a particular data key to be retrieved individually

$data = $json_data |convertfrom-Json
$data #append the data. with key value

