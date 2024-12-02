# Kasutaja käest palutakse sisestada ees-perenimi
$eesnimi = Read-Host "Sisesta oma eesnimi kasutaja kustutamiseks"
$perenimi = Read-Host "Sisesta oma perenimi kasutaja kustutamiseks"


$kasutajanimi = ($eesnimi.ToLower() + "." + $perenimi.ToLower())

# See kontrollib kas kasutaja on süsteemis olemas

$userExists = Get-LocalUser -Name $kasutajanimi -ErrorAction SilentlyContinue

If ($userExists) {
    # Kui kasutaja on olemas, proovime kustutada antud kasutaja
    try {
        Remove-LocalUser -Name $kasutajanimi -ErrorAction Stop
        Write-Host "Kasutaja $kasutajanimi on edukalt kustutatud."
}
    catch {
  
        Write-Host "Kasutaja $kasutajanimi kustutamine ebaõnnestus. Veateade :$_"
    }
  } else {
      Write-Host "Kasutajat $kasutajanimi ei leitud süsteemist. Kustutamine ebaõnnestus."
}


# Kontrollime käsu õnnestumist süsteemi muutujaga $?
if ($?) {
    Write-Host "Käsk õnnestus."
} else {
   Write-Host "Käsk ebaõnnestus."
}