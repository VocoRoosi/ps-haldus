param(
    $username,
    $fullname,
    $description
)

$userPassword = ConvertTo-SecureString 'qwerty' -AsPlainText -Force

New-LocalUser $username -Password $userPassword -FullName "$fullname" -Description "$description"