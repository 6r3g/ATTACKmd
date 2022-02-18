Tactics: [[DEFENSE_EVASION]]
Tags: #mitre/attack/techniques/T1112  

# Modify Registry - T1112
---
## Description
[more on T1112](https://attack.mitre.org/techniques/T1112)

Adversaries may interact with the Windows Registry to hide configuration information within Registry keys, remove information as part of cleaning up, or as part of other techniques to aid in persistence and execution.

Access to specific areas of the Registry depends on account permissions, some requiring administrator-level access. The built-in Windows command-line utility [Reg](https://attack.mitre.org/software/S0075) may be used for local or remote Registry modification. [1](https://technet.microsoft.com/en-us/library/cc732643.aspx) Other tools may also be used, such as a remote access tool, which may contain functionality to interact with the Registry through the Windows API.

Registry modifications may also include actions to hide keys, such as prepending key names with a null character, which will cause an error and/or be ignored when read via [Reg](https://attack.mitre.org/software/S0075) or other utilities using the Win32 API. [2](https://docs.microsoft.com/sysinternals/downloads/reghide) Adversaries may abuse these pseudo-hidden keys to conceal payloads/commands used to maintain persistence. [3](https://blog.trendmicro.com/trendlabs-security-intelligence/poweliks-malware-hides-in-windows-registry/) [4](https://posts.specterops.io/hiding-registry-keys-with-psreflect-b18ec5ac8353)

The Registry of a remote system may be modified to aid in execution of files as part of lateral movement. It requires the remote Registry service to be running on the target system. [5](https://technet.microsoft.com/en-us/library/cc754820.aspx) Often [[T1078_Valid Accounts|Valid Accounts (T1078)]] are required, along with access to the remote system's [[T1021_Remote Services#SMB/Windows Admin Shares - T1021 002|SMB/Windows Admin Shares (T1021.002)]] for RPC communication.

---
## Sub-Techniques

#### none