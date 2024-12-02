$userPassword = ConvertTo-SecureString 'qwerty' -AsPlainText -Force


New-LocalUser 'kasutaja1' -Password $userPassword -FullName 'Esimene Kasutaja' -Description 'Local account'