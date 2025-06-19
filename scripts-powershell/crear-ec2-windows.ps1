# Seleccionaremos el mismo tipo de instancia
$InstanceType = "t2.micro"

# En este caso utilizaremos la AMI 'Microsoft Windows Server 2019 Core Base'
$ImageId = "ami-060c2b9960a8002fb"

$KeyName = "vockey"
$SecurityGroupIds = "sg-0cb61073a2159903b"
$SubnetId = "subnet-073755d6654bed640"

# Creación de la instancia
$ec2 = New-EC2Instance -ImageId $ImageId -InstanceType $InstanceType -KeyName $KeyName -SecurityGroupIds $SecurityGroupIds -SubnetId $SubnetId  -AssociatePublicIp $true

# Para obtener el ID de la instancia agregamos esta variable
$instanceId = $ec2.Instances[0].InstanceId
Write-Output "Se creo la instancia con ID: $instanceId"

# Asignamos un tag a la instancia para diferenciarla luego en la interfaz de AWS.
New-EC2Tag -Resource $InstanceId -Tag @{ Key = "Name"; "Value" = "Instancia_Windows" }