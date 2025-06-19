# Seleccionamos el tipo de instancia
$InstanceType = "t2.micro"

# Para este caso nos dirigimos al catálogo de AMIs de EC2. Seleccionamos la que corresponde a 'Amazon Linux 2023 kernel-6.1'
$ImageId = "ami-09e6f87a47903347c"
$KeyName = "vockey"

# En este caso se especifica '0123456789abcdef0' como un valor de ejemplo. En un contexto real utilizaremos las IDs correspondientes al grupo de seguridad y subred que asociaremos a la instancia.
$SecurityGroupIds = "sg-0cb61073a2159903b"
$SubnetId = "subnet-073755d6654bed640"

# Creación de la instancia
$ec2 = New-EC2Instance -ImageId $ImageId -InstanceType $InstanceType -KeyName $KeyName -SecurityGroupIds $SecurityGroupIds -SubnetId $SubnetId  -AssociatePublicIp $true

# Para obtener el ID de la instancia agregamos esta variable
$instanceId = $ec2.Instances[0].InstanceId
Write-Output "Se creo la instancia con ID: $instanceId"

# Asignamos un tag a la instancia
New-EC2Tag -Resource $InstanceId -Tag @{ Key = "Name"; "Value" = "Instancia_Linux" }