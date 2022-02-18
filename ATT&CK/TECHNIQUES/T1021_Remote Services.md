Tactics: [[LATERAL_MOVEMENT]]
Tags: #mitre/attack/techniques/T1021  

# Remote Services - T1021
---
## Description
[more on T1021](https://attack.mitre.org/techniques/T1021)

Adversaries may use [[T1078_Valid Accounts|Valid Accounts (T1078)]] to log into a service specifically designed to accept remote connections, such as telnet, SSH, and VNC. The adversary may then perform actions as the logged-on user.

In an enterprise environment, servers and workstations can be organized into domains. Domains provide centralized identity management, allowing users to login using one set of credentials across the entire network. If an adversary is able to obtain a set of valid domain credentials, they could login to many different machines using remote access protocols such as secure shell (SSH) or remote desktop protocol (RDP).[1](https://www.ssh.com/ssh)[2](https://technet.microsoft.com/en-us/windowsserver/ee236407.aspx)

Legitimate applications (such as [[T1072_Software Deployment Tools|Software Deployment Tools (T1072)]] and other administrative programs) may utilize [[T1021_Remote Services|Remote Services (T1021)]] to access remote hosts. For example, Apple Remote Desktop (ARD) on macOS is native software used for remote management. ARD leverages a blend of protocols, including [[T1021_Remote Services#VNC - T1021 005|VNC (T1021.005)]] to send the screen and control buffers and [[T1021_Remote Services#SSH - T1021 004|SSH (T1021.004)]] for secure file transfer.[3](https://support.apple.com/en-us/HT209161)[4](https://support.apple.com/en-us/HT201710)[5](https://images.apple.com/remotedesktop/pdf/ARD_Admin_Guide_v3.3.pdf) Adversaries can abuse applications such as ARD to gain remote code execution and perform lateral movement. In versions of macOS prior to 10.14, an adversary can escalate an SSH session to an ARD session which enables an adversary to accept TCC (Transparency, Consent, and Control) prompts without user interaction and gain access to data.[6](https://www.fireeye.com/blog/threat-research/2019/10/leveraging-apple-remote-desktop-for-good-and-evil.html)[7](http://lockboxx.blogspot.com/2019/07/macos-red-teaming-206-ard-apple-remote.html)[4](https://support.apple.com/en-us/HT201710)

---
## Sub-Techniques

#### Remote Desktop Protocol - T1021.001
[more on T1021.001](https://attack.mitre.org/techniques/T1021/001)

Adversaries may use [[T1078_Valid Accounts|Valid Accounts (T1078)]] to log into a computer using the Remote Desktop Protocol (RDP). The adversary may then perform actions as the logged-on user.

Remote desktop is a common feature in operating systems. It allows a user to log into an interactive session with a system desktop graphical user interface on a remote system. Microsoft refers to its implementation of the Remote Desktop Protocol (RDP) as Remote Desktop Services (RDS).[1](https://technet.microsoft.com/en-us/windowsserver/ee236407.aspx)

Adversaries may connect to a remote system over RDP/RDS to expand access if the service is enabled and allows access to accounts with known credentials. Adversaries will likely use Credential Access techniques to acquire credentials to use with RDP. Adversaries may also use RDP in conjunction with the [[T1546_Event Triggered Execution#Accessibility Features - T1546 008|Accessibility Features (T1546.008)]] technique for Persistence.[2](http://blog.crowdstrike.com/adversary-tricks-crowdstrike-treats/)

#### SMB/Windows Admin Shares - T1021.002
[more on T1021.002](https://attack.mitre.org/techniques/T1021/002)

Adversaries may use [[T1078_Valid Accounts|Valid Accounts (T1078)]] to interact with a remote network share using Server Message Block (SMB). The adversary may then perform actions as the logged-on user.

SMB is a file, printer, and serial port sharing protocol for Windows machines on the same network or domain. Adversaries may use SMB to interact with file shares, allowing them to move laterally throughout a network. Linux and macOS implementations of SMB typically use Samba.

Windows systems have hidden network shares that are accessible only to administrators and provide the ability for remote file copy and other administrative functions. Example network shares include `C$`, `ADMIN$`, and `IPC$`. Adversaries may use this technique in conjunction with administrator-level [[T1078_Valid Accounts|Valid Accounts (T1078)]] to remotely access a networked system over SMB,[1](https://en.wikipedia.org/wiki/Server_Message_Block) to interact with systems using remote procedure calls (RPCs),[2](https://technet.microsoft.com/en-us/library/cc787851.aspx) transfer files, and run transferred binaries through remote Execution. Example execution techniques that rely on authenticated sessions over SMB/RPC are [[T1053_Scheduled Task-Job|Scheduled Task/Job (T1053)]], [[T1569_System Services#Service Execution - T1569 002|Service Execution (T1569.002)]], and [[T1047_Windows Management Instrumentation|Windows Management Instrumentation (T1047)]]. Adversaries can also use NTLM hashes to access administrator shares on systems with [[T1550_Use Alternate Authentication Material#Pass the Hash - T1550 002|Pass the Hash (T1550.002)]] and certain configuration and patch levels.[3](http://support.microsoft.com/kb/314984)

#### Distributed Component Object Model - T1021.003
[more on T1021.003](https://attack.mitre.org/techniques/T1021/003)

Adversaries may use [[T1078_Valid Accounts|Valid Accounts (T1078)]] to interact with remote machines by taking advantage of Distributed Component Object Model (DCOM). The adversary may then perform actions as the logged-on user.

The Windows Component Object Model (COM) is a component of the native Windows application programming interface (API) that enables interaction between software objects, or executable code that implements one or more interfaces. Through COM, a client object can call methods of server objects, which are typically Dynamic Link Libraries (DLL) or executables (EXE). Distributed COM (DCOM) is transparent middleware that extends the functionality of COM beyond a local computer using remote procedure call (RPC) technology.[1](https://www.fireeye.com/blog/threat-research/2019/06/hunting-com-objects.html)[2](https://msdn.microsoft.com/library/windows/desktop/ms680573.aspx)

Permissions to interact with local and remote server COM objects are specified by access control lists (ACL) in the Registry.[3](https://msdn.microsoft.com/en-us/library/windows/desktop/ms687317(v=vs.85).aspx) By default, only Administrators may remotely activate and launch COM objects through DCOM.[4](https://docs.microsoft.com/en-us/windows/desktop/com/dcom-security-enhancements-in-windows-xp-service-pack-2-and-windows-server-2003-service-pack-1)

Through DCOM, adversaries operating in the context of an appropriately privileged user can remotely obtain arbitrary and even direct shellcode execution through Office applications[5](https://enigma0x3.net/2017/11/16/lateral-movement-using-outlooks-createobject-method-and-dotnettojscript/) as well as other Windows objects that contain insecure methods.[6](https://enigma0x3.net/2017/01/05/lateral-movement-using-the-mmc20-application-com-object/)[7](https://enigma0x3.net/2017/01/23/lateral-movement-via-dcom-round-2/) DCOM can also execute macros in existing documents[8](https://enigma0x3.net/2017/09/11/lateral-movement-using-excel-application-and-dcom/) and may also invoke [[T1559_Inter-Process Communication#Dynamic Data Exchange - T1559 002|Dynamic Data Exchange (T1559.002)]] (DDE) execution directly through a COM created instance of a Microsoft Office application[9](https://www.cybereason.com/blog/leveraging-excel-dde-for-lateral-movement-via-dcom), bypassing the need for a malicious document. DCOM can be used as a method of remotely interacting with [[T1047_Windows Management Instrumentation|Windows Management Instrumentation (T1047)]]. [10](https://msdn.microsoft.com/en-us/library/aa394582.aspx)

#### SSH - T1021.004
[more on T1021.004](https://attack.mitre.org/techniques/T1021/004)

Adversaries may use [[T1078_Valid Accounts|Valid Accounts (T1078)]] to log into remote machines using Secure Shell (SSH). The adversary may then perform actions as the logged-on user.

SSH is a protocol that allows authorized users to open remote shells on other computers. Many Linux and macOS versions come with SSH installed by default, although typically disabled until the user enables it. The SSH server can be configured to use standard password authentication or public-private keypairs in lieu of or in addition to a password. In this authentication scenario, the user’s public key must be in a special file on the computer running the server that lists which keypairs are allowed to login as that user.

#### VNC - T1021.005
[more on T1021.005](https://attack.mitre.org/techniques/T1021/005)

Adversaries may use [[T1078_Valid Accounts|Valid Accounts (T1078)]] to remotely control machines using Virtual Network Computing (VNC). VNC is a platform-independent desktop sharing system that uses the RFB ("remote framebuffer") protocol to enable users to remotely control another computer’s display by relaying the screen, mouse, and keyboard inputs over the network.[1](https://datatracker.ietf.org/doc/html/rfc6143#section-7.2.2)

VNC differs from [[T1021_Remote Services#Remote Desktop Protocol - T1021 001|Remote Desktop Protocol (T1021.001)]] as VNC is screen-sharing software rather than resource-sharing software. By default, VNC uses the system's authentication, but it can be configured to use credentials specific to VNC.[2](https://support.apple.com/guide/remote-desktop/set-up-a-computer-running-vnc-software-apdbed09830/mac)[3](https://help.realvnc.com/hc/en-us/articles/360002250097-Setting-up-System-Authentication)

Adversaries may abuse VNC to perform malicious actions as the logged-on user such as opening documents, downloading files, and running arbitrary commands. An adversary could use VNC to remotely control and monitor a system to collect data and information to pivot to other systems within the network. Specific VNC libraries/implementations have also been susceptible to brute force attacks and memory usage exploitation.[4](https://int0x33.medium.com/day-70-hijacking-vnc-enum-brute-access-and-crack-d3d18a4601cc)[5](https://www.tenable.com/blog/detecting-macos-high-sierra-root-account-without-authentication)[6](https://www.bleepingcomputer.com/news/security/dozens-of-vnc-vulnerabilities-found-in-linux-windows-solutions/)[7](https://www.offensive-security.com/metasploit-unleashed/vnc-authentication/)[8](https://pentestlab.blog/2012/10/30/attacking-vnc-servers/)[9](http://lists.openstack.org/pipermail/openstack/2013-December/004138.html)

#### Windows Remote Management - T1021.006
[more on T1021.006](https://attack.mitre.org/techniques/T1021/006)

Adversaries may use [[T1078_Valid Accounts|Valid Accounts (T1078)]] to interact with remote systems using Windows Remote Management (WinRM). The adversary may then perform actions as the logged-on user.

WinRM is the name of both a Windows service and a protocol that allows a user to interact with a remote system (e.g., run an executable, modify the Registry, modify services).[1](http://msdn.microsoft.com/en-us/library/aa384426) It may be called with the `winrm` command or by any number of programs such as PowerShell.[2](https://www.slideshare.net/kieranjacobsen/lateral-movement-with-power-shell-2) WinRM can be used as a method of remotely interacting with [[T1047_Windows Management Instrumentation|Windows Management Instrumentation (T1047)]].[3](https://msdn.microsoft.com/en-us/library/aa394582.aspx)



