Tactics: [[PRIVILEGE_ESCALATION]] - [[DEFENSE_EVASION]]
Tags: #mitre/attack/techniques/T1134  

# Access Token Manipulation - T1134
---
## Description
[more on T1134](https://attack.mitre.org/techniques/T1134)

Adversaries may modify access tokens to operate under a different user or system security context to perform actions and bypass access controls. Windows uses access tokens to determine the ownership of a running process. A user can manipulate access tokens to make a running process appear as though it is the child of a different process or belongs to someone other than the user that started the process. When this occurs, the process also takes on the security context associated with the new token.

An adversary can use built-in Windows API functions to copy access tokens from existing processes; this is known as token stealing. These token can then be applied to an existing process (i.e. [[T1134_Access Token Manipulation#Token Impersonation/Theft - T1134 001|Token Impersonation/Theft (T1134.001)]]) or used to spawn a new process (i.e. [[T1134_Access Token Manipulation#Create Process with Token - T1134 002|Create Process with Token (T1134.002)]]). An adversary must already be in a privileged user context (i.e. administrator) to steal a token. However, adversaries commonly use token stealing to elevate their security context from the administrator level to the SYSTEM level. An adversary can then use a token to authenticate to a remote system as the account for that token if the account has appropriate permissions on the remote system.[1](https://pentestlab.blog/2017/04/03/token-manipulation/)

Any standard user can use the `runas` command, and the Windows API functions, to create impersonation tokens; it does not require access to an administrator account. There are also other mechanisms, such as Active Directory fields, that can be used to modify access tokens.

---
## Sub-Techniques

#### Token Impersonation/Theft - T1134.001
[more on T1134.001](https://attack.mitre.org/techniques/T1134/001)

Adversaries may duplicate then impersonate another user's token to escalate privileges and bypass access controls. An adversary can create a new access token that duplicates an existing token using `DuplicateToken(Ex)`. The token can then be used with `ImpersonateLoggedOnUser` to allow the calling thread to impersonate a logged on user's security context, or with `SetThreadToken` to assign the impersonated token to a thread.

An adversary may do this when they have a specific, existing process they want to assign the new token to. For example, this may be useful for when the target user has a non-network logon session on the system.

#### Create Process with Token - T1134.002
[more on T1134.002](https://attack.mitre.org/techniques/T1134/002)

Adversaries may create a new process with a different token to escalate privileges and bypass access controls. Processes can be created with the token and resulting security context of another user using features such as `CreateProcessWithTokenW` and `runas`.[1](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/cc771525(v=ws.11))

Creating processes with a different token may require the credentials of the target user, specific privileges to impersonate that user, or access to the token to be used (ex: gathered via other means such as [[T1134_Access Token Manipulation#Token Impersonation/Theft - T1134 001|Token Impersonation/Theft (T1134.001)]] or [[T1134_Access Token Manipulation#Make and Impersonate Token - T1134 003|Make and Impersonate Token (T1134.003)]]).

#### Make and Impersonate Token - T1134.003
[more on T1134.003](https://attack.mitre.org/techniques/T1134/003)

Adversaries may make and impersonate tokens to escalate privileges and bypass access controls. If an adversary has a username and password but the user is not logged onto the system, the adversary can then create a logon session for the user using the `LogonUser` function. The function will return a copy of the new session's access token and the adversary can use `SetThreadToken` to assign the token to a thread.

#### Parent PID Spoofing - T1134.004
[more on T1134.004](https://attack.mitre.org/techniques/T1134/004)

Adversaries may spoof the parent process identifier (PPID) of a new process to evade process-monitoring defenses or to elevate privileges. New processes are typically spawned directly from their parent, or calling, process unless explicitly specified. One way of explicitly assigning the PPID of a new process is via the `CreateProcess` API call, which supports a parameter that defines the PPID to use.[1](https://blog.didierstevens.com/2009/11/22/quickpost-selectmyparent-or-playing-with-the-windows-process-tree/) This functionality is used by Windows features such as User Account Control (UAC) to correctly set the PPID after a requested elevated process is spawned by SYSTEM (typically via `svchost.exe` or `consent.exe`) rather than the current user context.[2](https://docs.microsoft.com/windows/security/identity-protection/user-account-control/how-user-account-control-works)

Adversaries may abuse these mechanisms to evade defenses, such as those blocking processes spawning directly from Office documents, and analysis targeting unusual/potentially malicious parent-child process relationships, such as spoofing the PPID of [[T1059_Command and Scripting Interpreter#PowerShell - T1059 001|PowerShell (T1059.001)]]/[[T1218_Signed Binary Proxy Execution#Rundll32 - T1218 011|Rundll32 (T1218.011)]] to be `explorer.exe` rather than an Office document delivered as part of [[T1566_Phishing#Spearphishing Attachment - T1566 001|Spearphishing Attachment (T1566.001)]].[3](https://www.countercept.com/blog/detecting-parent-pid-spoofing/) This spoofing could be executed via [[T1059_Command and Scripting Interpreter#Visual Basic - T1059 005|Visual Basic (T1059.005)]] within a malicious Office document or any code that can perform [[T1106_Native API|Native API (T1106)]].[4](https://blog.christophetd.fr/building-an-office-macro-to-spoof-process-parent-and-command-line/)[3](https://www.countercept.com/blog/detecting-parent-pid-spoofing/)

Explicitly assigning the PPID may also enable elevated privileges given appropriate access rights to the parent process. For example, an adversary in a privileged user context (i.e. administrator) may spawn a new process and assign the parent as a process running as SYSTEM (such as `lsass.exe`), causing the new process to be elevated via the inherited access token.[5](https://blog.xpnsec.com/becoming-system/)

#### SID-History Injection - T1134.005
[more on T1134.005](https://attack.mitre.org/techniques/T1134/005)

Adversaries may use SID-History Injection to escalate privileges and bypass access controls. The Windows security identifier (SID) is a unique value that identifies a user or group account. SIDs are used by Windows security in both security descriptors and access tokens. [1](https://msdn.microsoft.com/library/windows/desktop/aa379571.aspx) An account can hold additional SIDs in the SID-History Active Directory attribute [2](https://msdn.microsoft.com/library/ms679833.aspx), allowing inter-operable account migration between domains (e.g., all values in SID-History are included in access tokens).

With Domain Administrator (or equivalent) rights, harvested or well-known SID values [3](https://support.microsoft.com/help/243330/well-known-security-identifiers-in-windows-operating-systems) may be inserted into SID-History to enable impersonation of arbitrary users/groups such as Enterprise Administrators. This manipulation may result in elevated access to local resources and/or access to otherwise inaccessible domains via lateral movement techniques such as [[T1021_Remote Services|Remote Services (T1021)]], [[T1021_Remote Services#SMB/Windows Admin Shares - T1021 002|SMB/Windows Admin Shares (T1021.002)]], or [[T1021_Remote Services#Windows Remote Management - T1021 006|Windows Remote Management (T1021.006)]].



