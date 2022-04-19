Clear-Host 

Set-ExecutionPolicy "Unrestricted"
New-LocalGroup -Name "Entreprise"
New-Item -Path "E:\" -Name "Entreprise" -Itemtype Directory

$EmplacementFichier = [string]
$EmplacementFichier = "./nom.csv"
#Fichier csv sauvegarder dans System32 pour fonctionner

$Users = Import-Csv $EmplacementFichier

foreach ($User in $Users)
{
    $FullName = $User.FullName
    $Name = $User.Name
    $AccountExpires = $User.AccountExpires
    $Description = $User.Description

    New-LocalUser -FullName $FullName -Name $Name -AccountExpires $AccountExpires -Description $Description -NoPassword

    Add-LocalGroupMember -Group "Entreprise" -Member "$Name"
    New-Item -Path "E:\Entreprise" -Name "$Name" -ItemType Directory
    New-Item -Path "E:\Entreprise\$Name" -Name "Bienvenue" -ItemType File -Value "Bonjour $FullName, bienvenu dans l'entreprise."
}

function New-User
{
 $FullName,$Name,$AccountExpires,$Description

New-LocalUser -Name "$Name" -FullName "$FullName" -AccountExpires "$AccountExpires" -Description "xyz" -NoPassword
}

