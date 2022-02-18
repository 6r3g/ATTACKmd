Tactics: [[DEFENSE_EVASION]]
Tags: #mitre/attack/techniques/T1222  

# File and Directory Permissions Modification - T1222
---
## Description
[more on T1222](https://attack.mitre.org/techniques/T1222)

Adversaries may modify file or directory permissions/attributes to evade access control lists (ACLs) and access protected files.[1](https://www.hybrid-analysis.com/sample/ef0d2628823e8e0a0de3b08b8eacaf41cf284c086a948bdfd67f4e4373c14e4d?environmentId=100)[2](https://www.hybrid-analysis.com/sample/22dab012c3e20e3d9291bce14a2bfc448036d3b966c6e78167f4626f5f9e38d6?environmentId=110) File and directory permissions are commonly managed by ACLs configured by the file or directory owner, or users with the appropriate permissions. File and directory ACL implementations vary by platform, but generally explicitly designate which users or groups can perform which actions (read, write, execute, etc.).

Modifications may include changing specific access rights, which may require taking ownership of a file or directory and/or elevated permissions depending on the file or directory’s existing permissions. This may enable malicious activity such as modifying, replacing, or deleting specific files or directories. Specific file and directory modifications may be a required step for many techniques, such as establishing Persistence via [[T1546_Event Triggered Execution#Accessibility Features - T1546 008|Accessibility Features (T1546.008)]], [[T1037_Boot or Logon Initialization Scripts|Boot or Logon Initialization Scripts (T1037)]], [[T1546_Event Triggered Execution#Unix Shell Configuration Modification - T1546 004|Unix Shell Configuration Modification (T1546.004)]], or tainting/hijacking other instrumental binary/configuration files via [[T1574_Hijack Execution Flow|Hijack Execution Flow (T1574)]].

---
## Sub-Techniques

#### Windows File and Directory Permissions Modification - T1222.001
[more on T1222.001](https://attack.mitre.org/techniques/T1222/001)

Adversaries may modify file or directory permissions/attributes to evade access control lists (ACLs) and access protected files.[1](https://www.hybrid-analysis.com/sample/ef0d2628823e8e0a0de3b08b8eacaf41cf284c086a948bdfd67f4e4373c14e4d?environmentId=100)[2](https://www.hybrid-analysis.com/sample/22dab012c3e20e3d9291bce14a2bfc448036d3b966c6e78167f4626f5f9e38d6?environmentId=110) File and directory permissions are commonly managed by ACLs configured by the file or directory owner, or users with the appropriate permissions. File and directory ACL implementations vary by platform, but generally explicitly designate which users or groups can perform which actions (read, write, execute, etc.).

Windows implements file and directory ACLs as Discretionary Access Control Lists (DACLs).[3](https://docs.microsoft.com/windows/desktop/secauthz/dacls-and-aces) Similar to a standard ACL, DACLs identifies the accounts that are allowed or denied access to a securable object. When an attempt is made to access a securable object, the system checks the access control entries in the DACL in order. If a matching entry is found, access to the object is granted. Otherwise, access is denied.[4](https://docs.microsoft.com/en-us/windows/win32/secauthz/access-control-lists)

Adversaries can interact with the DACLs using built-in Windows commands, such as `icacls`, `cacls`, `takeown`, and `attrib`, which can grant adversaries higher permissions on specific files and folders. Further, [[T1059_Command and Scripting Interpreter#PowerShell - T1059 001|PowerShell (T1059.001)]] provides cmdlets that can be used to retrieve or modify file and directory DACLs. Specific file and directory modifications may be a required step for many techniques, such as establishing Persistence via [[T1546_Event Triggered Execution#Accessibility Features - T1546 008|Accessibility Features (T1546.008)]], [[T1037_Boot or Logon Initialization Scripts|Boot or Logon Initialization Scripts (T1037)]], or tainting/hijacking other instrumental binary/configuration files via [[T1574_Hijack Execution Flow|Hijack Execution Flow (T1574)]].

#### Linux and Mac File and Directory Permissions Modification - T1222.002
[more on T1222.002](https://attack.mitre.org/techniques/T1222/002)

Adversaries may modify file or directory permissions/attributes to evade access control lists (ACLs) and access protected files.[1](https://www.hybrid-analysis.com/sample/ef0d2628823e8e0a0de3b08b8eacaf41cf284c086a948bdfd67f4e4373c14e4d?environmentId=100)[2](https://www.hybrid-analysis.com/sample/22dab012c3e20e3d9291bce14a2bfc448036d3b966c6e78167f4626f5f9e38d6?environmentId=110) File and directory permissions are commonly managed by ACLs configured by the file or directory owner, or users with the appropriate permissions. File and directory ACL implementations vary by platform, but generally explicitly designate which users or groups can perform which actions (read, write, execute, etc.).

Most Linux and Linux-based platforms provide a standard set of permission groups (user, group, and other) and a standard set of permissions (read, write, and execute) that are applied to each group. While nuances of each platform’s permissions implementation may vary, most of the platforms provide two primary commands used to manipulate file and directory ACLs: `chown` (short for change owner), and `chmod` (short for change mode).

Adversarial may use these commands to make themselves the owner of files and directories or change the mode if current permissions allow it. They could subsequently lock others out of the file. Specific file and directory modifications may be a required step for many techniques, such as establishing Persistence via [[T1546_Event Triggered Execution#Unix Shell Configuration Modification - T1546 004|Unix Shell Configuration Modification (T1546.004)]] or tainting/hijacking other instrumental binary/configuration files via [[T1574_Hijack Execution Flow|Hijack Execution Flow (T1574)]].[3](https://labs.sentinelone.com/20-common-tools-techniques-used-by-macos-threat-actors-malware/)




