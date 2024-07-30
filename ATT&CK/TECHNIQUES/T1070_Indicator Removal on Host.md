Tactics: [[DEFENSE_EVASION]]
Tags: #mitre/attack/techniques/T1070  

# Indicator Removal on Host - T1070
---
## Description
[more on T1070](https://attack.mitre.org/techniques/T1070)

Adversaries may delete or alter generated artifacts on a host system, including logs or captured files such as quarantined malware. Locations and format of logs are platform or product-specific, however standard operating system logs are captured as Windows events or Linux/macOS files such as [[T1552_Unsecured Credentials#Bash History - T1552 003|Bash History (T1552.003)]] and `/var/log/*`.

These actions may interfere with event collection, reporting, or other notifications used to detect intrusion activity. This may compromise the integrity of security solutions by causing notable events to go unreported. This activity may also impede forensic analysis and incident response, due to lack of sufficient data to determine what occurred.

---
## Sub-Techniques

#### Clear Windows Event Logs - T1070.001
[more on T1070.001](https://attack.mitre.org/techniques/T1070/001)

Adversaries may clear Windows Event Logs to hide the activity of an intrusion. Windows Event Logs are a record of a computer's alerts and notifications. There are three system-defined sources of events: System, Application, and Security, with five event types: Error, Warning, Information, Success Audit, and Failure Audit.

The event logs can be cleared with the following utility commands:

-   `wevtutil cl system`
-   `wevtutil cl application`
-   `wevtutil cl security`

These logs may also be cleared through other mechanisms, such as the event viewer GUI or [[T1059_Command and Scripting Interpreter#PowerShell - T1059 001|PowerShell (T1059.001)]].

#### Clear Linux or Mac System Logs - T1070.002
[more on T1070.002](https://attack.mitre.org/techniques/T1070/002)

Adversaries may clear system logs to hide evidence of an intrusion. macOS and Linux both keep track of system or user-initiated actions via system logs. The majority of native system logging is stored under the `/var/log/` directory. Subfolders in this directory categorize logs by their related functions, such as:[1](https://www.eurovps.com/blog/important-linux-log-files-you-must-be-monitoring/)

-   `/var/log/messages:`: General and system-related messages
-   `/var/log/secure` or `/var/log/auth.log`: Authentication logs
-   `/var/log/utmp` or `/var/log/wtmp`: Login records
-   `/var/log/kern.log`: Kernel logs
-   `/var/log/cron.log`: Crond logs
-   `/var/log/maillog`: Mail server logs
-   `/var/log/httpd/`: Web server access and error logs

#### Clear Command History - T1070.003
[more on T1070.003](https://attack.mitre.org/techniques/T1070/003)

In addition to clearing system logs, an adversary may clear the command history of a compromised account to conceal the actions undertaken during an intrusion. Various command interpreters keep track of the commands users type in their terminal so that users can retrace what they've done.

On Linux and macOS, these command histories can be accessed in a few different ways. While logged in, this command history is tracked in a file pointed to by the environment variable `HISTFILE`. When a user logs off a system, this information is flushed to a file in the user's home directory called `~/.bash_history`. The benefit of this is that it allows users to go back to commands they've used before in different sessions.

Adversaries may delete their commands from these logs by manually clearing the history (`history -c`) or deleting the bash history file `rm ~/.bash_history`.

On Windows hosts, PowerShell has two different command history providers: the built-in history and the command history managed by the `PSReadLine` module. The built-in history only tracks the commands used in the current session. This command history is not available to other sessions and is deleted when the session ends.

The `PSReadLine` command history tracks the commands used in all PowerShell sessions and writes them to a file (`$env:APPDATA\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt` by default). This history file is available to all sessions and contains all past history since the file is not deleted when the session ends.[1](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_history?view=powershell-7)

Adversaries may run the PowerShell command `Clear-History` to flush the entire command history from a current PowerShell session. This, however, will not delete/flush the `ConsoleHost_history.txt` file. Adversaries may also delete the `ConsoleHost_history.txt` file or edit its contents to hide PowerShell commands they have run.[2](https://community.sophos.com/products/intercept/early-access-program/f/live-discover-response-queries/121529/live-discover---powershell-command-audit)[3](https://community.sophos.com/products/malware/b/blog/posts/powershell-command-history-forensics)

#### File Deletion - T1070.004
[more on T1070.004](https://attack.mitre.org/techniques/T1070/004)

Adversaries may delete files left behind by the actions of their intrusion activity. Malware, tools, or other non-native files dropped or created on a system by an adversary may leave traces to indicate to what was done within a network and how. Removal of these files can occur during an intrusion, or as part of a post-intrusion process to minimize the adversary's footprint.

There are tools available from the host operating system to perform cleanup, but adversaries may use other tools as well. Examples include native [cmd](https://attack.mitre.org/software/S0106) functions such as DEL, secure deletion tools such as Windows Sysinternals SDelete, or other third-party file deletion tools. [1](http://blog.trendmicro.com/trendlabs-security-intelligence/in-depth-look-apt-attack-tools-of-the-trade/)

#### Network Share Connection Removal - T1070.005
[more on T1070.005](https://attack.mitre.org/techniques/T1070/005)

Adversaries may remove share connections that are no longer useful in order to clean up traces of their operation. Windows shared drive and [[T1021_Remote Services#SMB Windows Admin Shares - T1021 002|SMB Windows Admin Shares (T1021.002)]]  connections can be removed when no longer needed. [Net](https://attack.mitre.org/software/S0039) is an example utility that can be used to remove network share connections with the `net use \system\share /delete` command.

#### Timestomp - T1070.006
[more on T1070.006](https://attack.mitre.org/techniques/T1070/006)

Adversaries may modify file time attributes to hide new or changes to existing files. Timestomping is a technique that modifies the timestamps of a file (the modify, access, create, and change times), often to mimic files that are in the same folder. This is done, for example, on files that have been modified or created by the adversary so that they do not appear conspicuous to forensic investigators or file analysis tools.

Timestomping may be used along with file name [[T1036_Masquerading|Masquerading (T1036)]] to hide malware and tools.[1](http://windowsir.blogspot.com/2013/07/howto-determinedetect-use-of-anti.html)


#### Clear Network Connection History and Configurations - T1070.007
[more on T1070.007](https://attack.mitre.org/techniques/T1070/007)

Adversaries may clear or remove evidence of malicious network connections in order to clean up traces of their operations. Configuration settings as well as various artifacts that highlight connection history may be created on a system and/or in application logs from behaviors that require network connections, such as [[T1021_Remote Services|Remote Services]] or [[T1133_External Remote Services|External Remote Services]]. Defenders may use these artifacts to monitor or otherwise analyze network connections created by adversaries.

Network connection history may be stored in various locations. For example, RDP connection history may be stored in Windows Registry values under  [1](https://docs.microsoft.com/troubleshoot/windows-server/remote/remove-entries-from-remote-desktop-connection-computer):

- `HKEY_CURRENT_USER\Software\Microsoft\Terminal Server Client\Default`
- `HKEY_CURRENT_USER\Software\Microsoft\Terminal Server Client\Servers`

Windows may also store information about recent RDP connections in files such as `C:\Users\%username%\Documents\Default.rdp` and `C:\Users\%username%\AppData\Local\Microsoft\TerminalServer Client\Cache\`. [2](https://www.osdfcon.org/presentations/2020/Brian-Moran_Putting-Together-the-RDPieces.pdf) Similarly, macOS and Linux hosts may store information highlighting connection history in system logs (such as those stored in `/Library/Logs` and/or `/var/log/`). [3](https://discussions.apple.com/thread/3991574) [4](https://www.freedesktop.org/software/systemd/man/systemd-journald.service.html) [5](https://sarah-edwards-xzkc.squarespace.com/blog/2020/4/30/analysis-of-apple-unified-logs-quarantine-edition-entry-6-working-from-home-remote-logins)

Malicious network connections may also require changes to third-party applications or network configuration settings, such as [[T1562_Impair Defenses#Disable or Modify System Firewall - T1562.004|Disable or Modify System Firewall]] or tampering to enable [[T1090_Proxy|Proxy]]. Adversaries may delete or modify this data to conceal indicators and/or impede defensive analysis.

#### Clear Mailbox Data - T1070.008
[more on T1070.008](https://attack.mitre.org/techniques/T1070/008)

Adversaries may modify mail and mail application data to remove evidence of their activity. Email applications allow users and other programs to export and delete mailbox data via command line tools or use of APIs. Mail application data can be emails, email metadata, or logs generated by the application or operating system, such as export requests.

Adversaries may manipulate emails and mailbox data to remove logs, artifacts, and metadata, such as evidence of [[T1566_Phishing|Phishing]]/[[T1534_Internal Spearphishing|Internal Spearphishing]], [[T1114_Email Collection|Email Collection]], [[T1071_Application Layer Protocol#Mail Protocols - T1071.003|Mail Protocols]] for command and control, or email-based exfiltration such as [[T1048_Exfiltration Over Alternative Protocol|Exfiltration Over Alternative Protocol]]. For example, to remove evidence on Exchange servers adversaries have used the `ExchangePowerShell` [[T1059_Command and Scripting Interpreter#Powershell - T1059.001|PowerShell]] module, including `Remove-MailboxExportRequest` to remove evidence of mailbox exports. [1](https://www.volexity.com/blog/2020/12/14/dark-halo-leverages-solarwinds-compromise-to-breach-organizations/) [2](https://docs.microsoft.com/en-us/powershell/module/exchange/?view=exchange-ps#mailboxes) On Linux and macOS, adversaries may also delete emails through a command line utility called `mail` or use [[T1059_Command and Scripting Interpreter#AppleScript - T1059.002|AppleScript]] to interact with APIs on macOS. [3](https://cdn2.hubspot.net/hubfs/3354902/Cybereason%20Labs%20Analysis%20Operation%20Cobalt%20Kitty.pdf) [4](https://man7.org/linux/man-pages/man1/mailx.1p.html)

Adversaries may also remove emails and metadata/headers indicative of spam or suspicious activity (for example, through the use of organization-wide transport rules) to reduce the likelihood of malicious emails being detected by security products. [5](https://www.microsoft.com/en-us/security/blog/2022/09/22/malicious-oauth-applications-used-to-compromise-email-servers-and-spread-spam/)

#### Clear Persistence - T1070.009
[more on T1070.009](https://attack.mitre.org/techniques/T1070/009)

Adversaries may clear artifacts associated with previously established persistence on a host system to remove evidence of their activity. This may involve various actions, such as removing services, deleting executables, [[T1112_Modify Registry|Modify Registry]], [[T1647_Plist File Modification|Plist File Modification]], or other methods of cleanup to prevent defenders from collecting evidence of their persistent presence. [1](https://s7d2.scene7.com/is/content/cylance/prod/cylance-web/en-us/resources/knowledge-center/resource-library/reports/Op_Dust_Storm_Report.pdf) Adversaries may also delete accounts previously created to maintain persistence (i.e. [[T1136_Create Account|Create Account]]). [2](https://blog.talosintelligence.com/recent-cyber-attack/)

In some instances, artifacts of persistence may also be removed once an adversary’s persistence is executed in order to prevent errors with the new instance of the malware. [3](https://research.nccgroup.com/2020/06/02/in-depth-analysis-of-the-new-team9-malware-family/)
