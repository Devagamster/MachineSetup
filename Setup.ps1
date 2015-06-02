function Expand-ZIPFile($file, $destination)
{
    $shell = new-object -com shell.application
    $zip = $shell.NameSpace($file)
    foreach($item in $zip.items())
    {
        $shell.Namespace($destination).copyhere($item)
    }
}

$HOME = Resolve-Path .
$env:HOME = $HOME
$env:Path += ";" + $HOME + "/msysgit"
$env:Path += ";" + $HOME + "/ConEmu"

(new-object System.Net.WebClient).DownloadFile("https://github.com/Devagamster/MachineSetup/archive/master.zip", "$pwd\MachineSetup.zip")

Expand-ZIPFile(".\MachineSetup.zip", ".")

(new-object System.Net.WebClient).DownloadFile("https://github.com/msysgit/msysgit/releases/download/Git-1.9.5-preview20150319/PortableGit-1.9.5-preview20150319.7z", "$pwd\msysgit.7z")

.\7-zip\7z.exe e .\msysgit.7z.7z -o* -y

(new-object System.Net.WebClient).DownloadFile("https://github.com/Maximus5/ConEmu/releases/download/v15.05.13/ConEmuPack.150513.7z", "$pwd\ConEmu.7z")

.\7-zip\7z.exe e .\ConEmu.7z -o* -y

mv .\ConEmu.xml .\ConEmu

.\ConEmu\ConEmuC.exe \AutoAttach
