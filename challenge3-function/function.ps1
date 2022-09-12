function jsonob ([object] $jsonob) {
    $result= $jsonob | ConvertFrom-Json
    return $result
}

#input a json file in variable

$output=   jsonob $jsonfile = '{
"Cloud":"azure",
"resourcetype":"Microsoft.Compute/virtualMachines",
"vmname":[
"vm1",
"vm2"
] }'

Write-Output $output.vmname

