![image](https://github.com/user-attachments/assets/94c32cf6-7c1e-448e-a61c-a7544bb0f159)
![image](https://github.com/user-attachments/assets/0a2e9604-e8c3-4719-8d23-25d74d232d8e)


⚠️ WARNING ⚠️
This script is for EDUCATIONAL/ETHICAL USE ONLY:

🚫 Illegal Activity Prohibited: Using this code to bypass security measures or log keystrokes without explicit consent violates laws and ethical standards.

🔒 Authorized Use Only: Deploy only on systems you own or have written permission to test.

⚠️ Risks: Antivirus/EDR tools may flag this as malware. Use in isolated labs, NOT production environments.

🛑 Liability: The author assumes no responsibility for misuse.

By using this code, you agree to act lawfully and ethically.



<h1>PowerShell AMSI Bypass Module</h1>

Date : 5/27/2025

<h4>Purpose:</h4> 
Demonstrates a reflection-based technique to disable AMSI (Antimalware Scan Interface) in PowerShell 5.1 sessions.

<h4>Overview:</h4>
This module temporarily bypasses AMSI (Antimalware Scan Interface) in Windows PowerShell 5.1 by 
manipulating internal .NET components. AMSI is a security feature that scans scripts/memory for malicious content.

<h1>Technical Breakdown</h1>
Target: Modifies the amsiInitFailed flag in the System.Management.Automation.AmsiUtils class.

<h4>Mechanism:</h4>

1. Loads the PowerShell .NET assembly.

2. Uses reflection to set the private static amsiInitFailed field to $true.

3. Tricks AMSI into believing initialization failed, disabling scans for the current session.


<h4>exampleUsage.ps1 Description:</h4>

This script bypasses AMSI (Antimalware Scan Interface) and logs keystrokes to keylog.txt. It demonstrates basic keylogging via Win32 API calls.

Features:

Disables AMSI detection (PowerShell 5.1).

Captures and saves pressed keys silently.

Use Case: Educational/authorized testing only.
