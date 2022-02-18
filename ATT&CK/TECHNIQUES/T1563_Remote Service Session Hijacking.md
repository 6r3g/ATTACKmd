Tactics: [[LATERAL_MOVEMENT]]
Tags: #mitre/attack/techniques/T1563  

# Remote Service Session Hijacking - T1563
---
## Description
[more on T1563](https://attack.mitre.org/techniques/T1563)

Adversaries may take control of preexisting sessions with remote services to move laterally in an environment. Users may use valid credentials to log into a service specifically designed to accept remote connections, such as telnet, SSH, and RDP. When a user logs into a service, a session will be established that will allow them to maintain a continuous interaction with that service.

Adversaries may commandeer these sessions to carry out actions on remote systems. [[T1563_Remote Service Session Hijacking|Remote Service Session Hijacking (T1563)]] differs from use of [[T1021_Remote Services|Remote Services (T1021)]] because it hijacks an existing session rather than creating a new session using [[T1078_Valid Accounts|Valid Accounts (T1078)]].[1](https://medium.com/@networksecurity/rdp-hijacking-how-to-hijack-rds-and-remoteapp-sessions-transparently-to-move-through-an-da2a1e73a5f6)[2](https://matrix.org/blog/2019/05/08/post-mortem-and-remediations-for-apr-11-security-incident)

---
## Sub-Techniques

#### SSH Hijacking - T1563.001
[more on T1563.001](https://attack.mitre.org/techniques/T1563/001)

Adversaries may hijack a legitimate user's SSH session to move laterally within an environment. Secure Shell (SSH) is a standard means of remote access on Linux and macOS systems. It allows a user to connect to another system via an encrypted tunnel, commonly authenticating through a password, certificate or the use of an asymmetric encryption key pair.

In order to move laterally from a compromised host, adversaries may take advantage of trust relationships established with other systems via public key authentication in active SSH sessions by hijacking an existing connection to another system. This may occur through compromising the SSH agent itself or by having access to the agent's socket. If an adversary is able to obtain root access, then hijacking SSH sessions is likely trivial.[1](https://www.slideshare.net/morisson/mistrusting-and-abusing-ssh-13526219)[2](https://www.blackhat.com/presentations/bh-usa-05/bh-us-05-boileau.pdf)[3](https://www.clockwork.com/news/2012/09/28/602/ssh_agent_hijacking)[4](https://matrix.org/blog/2019/05/08/post-mortem-and-remediations-for-apr-11-security-incident)

[[T1563_Remote Service Session Hijacking#SSH Hijacking - T1563 001|SSH Hijacking (T1563.001)]] differs from use of [[T1021_Remote Services#SSH - T1021 004|SSH (T1021.004)]] because it hijacks an existing SSH session rather than creating a new session using [[T1078_Valid Accounts|Valid Accounts (T1078)]].

#### RDP Hijacking - T1563.002
[more on T1563.002](https://attack.mitre.org/techniques/T1563/002)

Adversaries may hijack a legitimate user’s remote desktop session to move laterally within an environment. Remote desktop is a common feature in operating systems. It allows a user to log into an interactive session with a system desktop graphical user interface on a remote system. Microsoft refers to its implementation of the Remote Desktop Protocol (RDP) as Remote Desktop Services (RDS).[1](https://technet.microsoft.com/en-us/windowsserver/ee236407.aspx)

Adversaries may perform RDP session hijacking which involves stealing a legitimate user's remote session. Typically, a user is notified when someone else is trying to steal their session. With System permissions and using Terminal Services Console, `c:\windows\system32\tscon.exe [session number to be stolen]`, an adversary can hijack a session without the need for credentials or prompts to the user.[2](http://www.korznikov.com/2017/03/0-day-or-feature-privilege-escalation.html) This can be done remotely or locally and with active or disconnected sessions.[3](https://medium.com/@networksecurity/rdp-hijacking-how-to-hijack-rds-and-remoteapp-sessions-transparently-to-move-through-an-da2a1e73a5f6) It can also lead to [[T1018_Remote System Discovery|Remote System Discovery (T1018)]] and Privilege Escalation by stealing a Domain Admin or higher privileged account session. All of this can be done by using native Windows commands, but it has also been added as a feature in red teaming tools.[4](https://github.com/nccgroup/redsnarf)



