module virtualWan 'br/public:avm/res/network/virtual-wan:0.1.1' = {
  name: 'virtualWanDeployment'
  params: {
    // Required parameters
    name: 'VWAN01'
  }
}

module virtualHub 'br/public:avm/res/network/virtual-hub:0.1.1' = {
  name: 'virtualHubDeployment'
  params: {
    // Required parameters
    addressPrefix: '10.0.0.0/16'
    name: 'VWAN01'
    virtualWanId: virtualWan.outputs.resourceId
  }
  dependsOn: [
    virtualWan
  ]
}

module virtualNetwork1 'br/public:avm/res/network/virtual-network:0.1.6' = {
  name: 'virtualNetworkDeployment1'
  params: {
    // Required parameters
    addressPrefixes: [
      '10.10.0.0/16'
    ]
    name: 'VNET01'
    // Non-required parameters
    subnets: [
      {
        addressPrefix: '10.10.0.0/24'
        name: 'Subnet01'
      }
    ]
  }
  dependsOn: [
    virtualHub
  ]
}

module virtualNetwork2 'br/public:avm/res/network/virtual-network:0.1.6' = {
  name: 'virtualNetworkDeployment2'
  params: {
    // Required parameters
    addressPrefixes: [
      '10.11.0.0/16'
    ]
    name: 'VNET02'
    // Non-required parameters
    subnets: [
      {
        addressPrefix: '10.11.0.0/24'
        name: 'Subnet02'
      }
    ]
  }
  dependsOn: [
    virtualHub
  ]
}

module virtualMachine1 'br/public:avm/res/compute/virtual-machine:0.4.2' = {
  name: 'virtualMachineDeployment321'
  params: {
    // Required parameters
    adminUsername: 'LocalAdmin'
    imageReference: {
      offer: 'WindowsServer'
      publisher: 'MicrosoftWindowsServer'
      sku: '2022-datacenter-azure-edition'
      version: 'latest'
    }
    name: 'VM01'
    nicConfigurations: [
      {
        ipConfigurations: [
          {
            name: 'ipconfig01'
            subnetResourceId: virtualNetwork1.outputs.subnetResourceIds[0]
          }
        ]
        nicSuffix: '-nic-01'
      }
    ]
    osDisk: {
      caching: 'ReadWrite'
      diskSizeGB: 128
      managedDisk: {
        storageAccountType: 'Standard_LRS'
      }
    }
    osType: 'Windows'
    vmSize: 'Standard_D2as_v4'
    zone: 0
    // Non-required parameters
    adminPassword: 'MiniHackathon123!'
    location: 'WestEurope'
    ultraSSDEnabled: false
  }
  dependsOn: [
    virtualNetwork1
  ]
}

module virtualMachine2 'br/public:avm/res/compute/virtual-machine:0.4.2' = {
  name: 'virtualMachineDeployment123'
  params: {
    // Required parameters
    adminUsername: 'LocalAdmin'
    imageReference: {
      offer: 'WindowsServer'
      publisher: 'MicrosoftWindowsServer'
      sku: '2022-datacenter-azure-edition'
      version: 'latest'
    }
    name: 'VM02'
    nicConfigurations: [
      {
        ipConfigurations: [
          {
            name: 'ipconfig01'
            subnetResourceId: virtualNetwork2.outputs.subnetResourceIds[0]
          }
        ]
        nicSuffix: '-nic-01'
      }
    ]
    osDisk: {
      caching: 'ReadWrite'
      diskSizeGB: 128
      managedDisk: {
        storageAccountType: 'Standard_LRS'
      }
    }
    osType: 'Windows'
    vmSize: 'Standard_D2as_v4'
    zone: 0
    // Non-required parameters
    adminPassword: 'MiniHackathon123!'
    location: 'WestEurope'
    ultraSSDEnabled: false
  }
  dependsOn: [
    virtualNetwork2
  ]
}
