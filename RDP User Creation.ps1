# My simple RDP user creation script
Write-Host "Enter a username:"
$NameForUser = Read-Host
Write-Host "Enter a password"
$SecurePassword = Read-Host -AsSecureString

# Create a new user
New-ADUser -Name $NameForUser -AccountPassword $SecurePassword -ChangePasswordAtLogon $false -PassThru | Enable-ADAccount

# Add new user to RDP group
Add-ADGroupMember -Identity "RDP Users" -Members $NameForUser