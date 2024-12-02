# Kasutaja käest palutakse sisestada ees-perenimi
$eesnimi = Read-Host "Sisesta oma eesnimi"
$perenimi = Read-Host "Sisesta oma perenimi"

# Loome kasutajanime
$kasutajanimi = ($eesnimi.ToLower() + "." + $perenimi.ToLower())

# Loome täisnime ja kirjelduse
$fullname = "$eesnimi $perenimi"
$description = "Lokaalne konto"
$password = "Parool1!" | ConvertTo-SecureString -AsPlainText -Force

# Proovime luua kasutaja
try {
    New-LocalUser -Name $eesnimi -Password $password -FullName "$fullname" -Description "$description" -ErrorAction SilentlyContinue
    Write-Host "Kasutaja $kasutajanimi on edukalt loodud."
}
catch {
   Write-Host "Kasutaja loomine ebaõnnestus. Veateade: $_"
}

# Kontrollime käsu õnnestumist süsteemi muutujaga $?
if ($?) {
    Write-Host "Käsk õnnestus."
} else {
   Write-Host "Käsk ebaõnnestus."
}