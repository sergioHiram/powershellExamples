#Creando un objeto nuevo
$ObjetoNuevo = New-Object -TypeName PsObject -Property @{
    Nombre = "Server1"
    Rol = "WebServer"
    Ambiente = "Prod"
    Area = "Ventas"
}

#Usando el objeto
$ObjetoNuevo.Nombre
$ObjetoNuevo.Rol
$ObjetoNuevo.Ambiente
$ObjetoNuevo.Area

#Creando objeto apartir de Get-WMIObject
$Data = Get-WmiObject -Class Win32_ComputerSystem | Select-Object -Property * #Información del sistema
$DataNetwork = Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where-Object -property Index -eq 1 #Información del NIC de red
$ObjetoSistema = New-Object -TypeName PSCustomObject #Creando el objeto nuevo

#Agregando propiedades y valores al objeto nuevo
Add-Member -InputObject $ObjetoSistema -MemberType NoteProperty -Name Domain -Value ($Data.Domain) -Force
Add-Member -InputObject $ObjetoSistema -MemberType NoteProperty -Name Manufacturer -Value ($Data.Manufacturer) -Force
Add-Member -InputObject $ObjetoSistema -MemberType NoteProperty -Name Ip -Value ($DataNetwork.IPAddress[0]) -Force
Add-Member -InputObject $ObjetoSistema -MemberType NoteProperty -Name NetworkDescription -Value ($DataNetwork.Description) -Force



$ObjetoSistema.Ip