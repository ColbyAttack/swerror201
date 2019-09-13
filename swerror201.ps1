#colby@anathem.io 20190913 SW
#Set user account and password for service admin
#dont be dumb, run as admin
$user = 'test'
$pass = 'testpass'


#Adds user account
net user $user $pass /add /Y
net localgroup Administrators $user /add

#Enable File and Printer Sharing
netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=Yes

#Add reg key 
New-Item -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Force | New-ItemProperty -Name LocalAccountTokenFilterPolicy -PropertyType DWORD -Value 1 -Force | Out-Null
