$file = "C:\Users\Rose\ps_haldus\users.csv"
$users = Import-Csv $file -Encoding Default -Delimiter ";"
foreach ($user in $users) {
  $username = $user.Username
  $fullname = $user.FullName
  $description = $user.Description
  $password = $user.Password | ConvertTo-SecureString -AsPlainText -Force
  
  New-LocalUser -Name $username -Password $password -FullName "$username" -Description "$description" -ErrorAction SilentlyContinue

}