Tactics: [[EXECUTION]]
Tags: #mitre/attack/techniques/T1047  

# Windows Management Instrumentation - T1047
---
## Description
[more on T1047](https://attack.mitre.org/techniques/T1047)

Adversaries may abuse Windows Management Instrumentation (WMI) to execute malicious commands and payloads. WMI is an administration feature that provides a uniform environment to access Windows system components. The WMI service enables both local and remote access, though the latter is facilitated by [[T1021_Remote Services|Remote Services (T1021)]] such as [[T1021_Remote Services#Distributed Component Object Model - T1021 003|Distributed Component Object Model (T1021.003)]] (DCOM) and [[T1021_Remote Services#Windows Remote Management - T1021 006|Windows Remote Management (T1021.006)]] (WinRM). [1](https://msdn.microsoft.com/en-us/library/aa394582.aspx) Remote WMI over DCOM operates using port 135, whereas WMI over WinRM operates over port 5985 when using HTTP and 5986 for HTTPS. [1](https://msdn.microsoft.com/en-us/library/aa394582.aspx) [2](https://www.fireeye.com/content/dam/fireeye-www/global/en/current-threats/pdfs/wp-windows-management-instrumentation.pdf)

An adversary can use WMI to interact with local and remote systems and use it as a means to execute various behaviors, such as gathering information for [[Discovery]] as well as remote Execution of files as part of Lateral Movement. [3](https://www.fireeye.com/content/dam/fireeye-www/services/pdfs/sans-dfir-2015.pdf) [2](https://www.fireeye.com/content/dam/fireeye-www/global/en/current-threats/pdfs/wp-windows-management-instrumentation.pdf)

---
## Sub-Techniques

#### none