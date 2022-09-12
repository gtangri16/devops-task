locals {
     nsg_rules_web=  [
                          {
                              "name"=  "ob_https"
                              "description"=  ""
                              "priority"=  103
                              "access"=  "Allow"
                              "direction"=  "Outbound"
                              "protocol"=  "Tcp"
                              "sourceAddressPrefix"=  "*"
                              "sourceAddressPrefixes"=  null
                              "sourcePortRange"=  "*"
                              "sourcePortRanges"=  null
                              "destinationAddressPrefix"=  "*"
                              "destinationAddressPrefixes"=  null
                              "destinationPortRange"=  "443"
                              "destinationPortRanges"=  null
                          },
						  {
                              "name"=  "ib_azure_LB"
                              "description"=  "AllowAzureLBtraffic"
                              "priority"=  4095
                              "access"=  "Allow"
                              "direction"=  "Inbound"
                              "protocol"=  "*"
                              "sourceAddressPrefix"=  "AzureLoadBalancer"
                              "sourceAddressPrefixes"=  null
                              "sourcePortRange"=  "*"
                              "sourcePortRanges"=  null
                              "destinationAddressPrefix"=  "*"
                              "destinationAddressPrefixes"=  null 
                              "destinationPortRange"=  "*"
                              "destinationPortRanges"=  null
                          },
						  {
                              "name"=  "ob_azure_LB"
                              "description"=  "AllowAzureLBoutboundtraffic"
                              "priority"=  4095
                              "access"=  "Allow"
                              "direction"=  "Outbound"
                              "protocol"=  "*"
                              "sourceAddressPrefix"=  "*"
                              "sourceAddressPrefixes"=  null
                              "sourceapplicationsecuritygroupids"=  null
                              "sourcePortRange"=  "*"
                              "sourcePortRanges"=  null
                              "destinationAddressPrefix"=  "AzureLoadBalancer"
                              "destinationAddressPrefixes"=  null
                              "destinationapplicationsecuritygroupids"=  null
                              "destinationPortRange"=  "*"
                              "destinationPortRanges"=  null
                          },
						  ]
						  
nsg_rules_backend =  [
						  {
						      "name"=  "vnet_inbound"
                              "description"=  "Allow VNET Inbound"
                              "priority"=  100
                              "access"=  "Allow"
                              "direction"=  "Inbound"
                              "protocol"=  "*"
                              "sourceAddressPrefix"=  "VirtualNetwork"
                              "sourceAddressPrefixes"=  null
                              "sourceapplicationsecuritygroupids"=  null
                              "sourcePortRange"=  "*"
                              "sourcePortRanges"=  null
                              "destinationAddressPrefix"=  "VirtualNetwork"
                              "destinationAddressPrefixes"=  null
                              "destinationapplicationsecuritygroupids"=  null
                              "destinationPortRange"=  "*"
                              "destinationPortRanges"=  null
							  },
        {
		
		                      "name"=  "Ib_flow_logging"
                              "description"=  "Allow VNET Inbound"
                              "priority"=  101
                              "access"=  "Allow"
                              "direction"=  "Inbound"
                              "protocol"=  "*"
                              "sourceAddressPrefix"=   "168.63.129.16"
                              "sourceAddressPrefixes"=  null
                              "sourceapplicationsecuritygroupids"=  null
                              "sourcePortRange"=  "*"
                              "sourcePortRanges"=  null
                              "destinationAddressPrefix"=  "*"
                              "destinationAddressPrefixes"=  null
                              "destinationapplicationsecuritygroupids"=  null
                              "destinationPortRange"=  "*"
                              "destinationPortRanges"=  null
        },
		
           {
                              "name"=  "ib_ping"
                              "description"=  "Allow icmp Inbound rule."
                              "priority"=  103
                              "access"=  "Allow"
                              "direction"=  "Inbound"
                              "protocol"=  "Icmp"
                              "sourceAddressPrefix"=  "VirtualNetwork"
                              "sourceAddressPrefixes"=  null
                              "sourceapplicationsecuritygroupids"=  null
                              "sourcePortRange"=  "*"
                              "sourcePortRanges"=  null
                              "destinationAddressPrefix"=  "VirtualNetwork"
                              "destinationAddressPrefixes"=  null
                              "destinationapplicationsecuritygroupids"=  null
                              "destinationPortRange"=  "*"
                              "destinationPortRanges"=  null
                          },
        ]
nsg_rules_db=  [

{
                               "name"=  "ib_db"
                              "description"=  "Allow Db rule."
                              "priority"=  104
                              "access"=  "Allow"
                              "direction"=  "Inbound"
                              "protocol"=  "Tcp"
                              "sourceAddressPrefix"=  "VirtualNetwork"
                              "sourceAddressPrefixes"=  null
                              "sourceapplicationsecuritygroupids"=  null
                              "sourcePortRange"=  "1433"
                              "sourcePortRanges"=  null
                              "destinationAddressPrefix"=  "VirtualNetwork"
                              "destinationAddressPrefixes"=  null
                              "destinationapplicationsecuritygroupids"=  null
                              "destinationPortRange"=  "*"
                              "destinationPortRanges"=  null
        }

]
}