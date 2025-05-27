![image](https://github.com/user-attachments/assets/94c32cf6-7c1e-448e-a61c-a7544bb0f159)
![image](https://github.com/user-attachments/assets/0a2e9604-e8c3-4719-8d23-25d74d232d8e)

PowerShell AMSI Bypass Module

Date : 5/27/2025

Purpose: Demonstrates a reflection-based technique to disable AMSI (Antimalware Scan Interface) in PowerShell 5.1 sessions.

Overview:
This module temporarily bypasses AMSI (Antimalware Scan Interface) in Windows PowerShell 5.1 by 
manipulating internal .NET components. AMSI is a security feature that scans scripts/memory for malicious content.


Technical Breakdown
Target: Modifies the amsiInitFailed flag in the System.Management.Automation.AmsiUtils class.

Mechanism:

1. Loads the PowerShell .NET assembly.

2. Uses reflection to set the private static amsiInitFailed field to $true.

3. Tricks AMSI into believing initialization failed, disabling scans for the current session.
