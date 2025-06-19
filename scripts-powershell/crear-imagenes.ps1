# Parámetros de la instancia Linux
$InstanceId_1 = "i-0d92f60d5de0dbf20"
$ImageName_1 = "Imagen_Linux"

# Parámetros de la instancia Windows
$InstanceId_2 = "i-05af974968383824f"
$ImageName_2 = "Imagen_Windows"

# Crear la AMI de Linux
New-EC2Image -InstanceId $InstanceId_1 -Name $ImageName_1 -NoReboot $true

# Crear la AMI de Windows
New-EC2Image -InstanceId $InstanceId_2 -Name $ImageName_2 -NoReboot $true
