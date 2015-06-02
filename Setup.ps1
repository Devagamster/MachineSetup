$env:HOME = $pwd
$env:Path += ";" + $pwd + "/msysgit"
$env:Path += ";" + $pwd + "/ConEmu"

$client = new-object System.Net.WebClient
$MachineSetupRepository = "https://github.com/Devagamster/MachineSetup/raw/master/"

$client.DownloadFile($MachineSetupRepository + "7z.dll", "$pwd\7z.dll")
$client.DownloadFile($MachineSetupRepository + "7z.exe", "$pwd\7z.exe")

# $client.DownloadFile("https://github.com/msysgit/msysgit/releases/download/Git-1.9.5-preview20150319/PortableGit-1.9.5-preview20150319.7z", "$pwd\msysgit.7z")
# .\7-zip\7z.exe e .\msysgit.7z.7z -o* -y

$client.DownloadFile("https://github.com/Maximus5/ConEmu/releases/download/v15.05.13/ConEmuPack.150513.7z", "$pwd\ConEmu.7z")

7z.exe e .\ConEmu.7z -o* -y

$client.DownloadFile($MachineSetupRepository + "ConEmu.xml", "$pwd\ConEmu\ConEmu.xml")

.\ConEmu\ConEmuC.exe \AutoAttach
