Tactics: [[CREDENTIAL_ACCESS]]
Tags: #mitre/attack/techniques/T1003  

# OS Credential Dumping - T1003
---
## Description
[more on T1003](https://attack.mitre.org/techniques/T1003)

Adversaries may attempt to dump credentials to obtain account login and credential material, normally in the form of a hash or a clear text password, from the operating system and software. Credentials can then be used to perform [[LATERAL_MOVEMENT|Lateral Movement (TA0008)]] and access restricted information.

Several of the tools mentioned in associated sub-techniques may be used by both adversaries and professional security testers. Additional custom tools likely exist as well.

---
## Sub-Techniques

#### LSASS Memory - T1003.001
[more on T1003.001](https://attack.mitre.org/techniques/T1003/001)

Adversaries may attempt to access credential material stored in the process memory of the Local Security Authority Subsystem Service (LSASS). After a user logs on, the system generates and stores a variety of credential materials in LSASS process memory. These credential materials can be harvested by an administrative user or SYSTEM and used to conduct [[LATERAL_MOVEMENT|Lateral Movement (TA0008)]] using [[T1550_Use Alternate Authentication Material|Use Alternate Authentication Material (T1550)]].

As well as in-memory techniques, the LSASS process memory can be dumped from the target host and analyzed on a local system.

For example, on the target host use procdump:

-   `procdump -ma lsass.exe lsass_dump`

Locally, mimikatz can be run using:

-   `sekurlsa::Minidump lsassdump.dmp`
-   `sekurlsa::logonPasswords`

Built-in Windows tools such as comsvcs.dll can also be used:

-   `rundll32.exe C:\Windows\System32\comsvcs.dll MiniDump PID lsass.dmp full`[1](https://www.volexity.com/blog/2021/03/02/active-exploitation-of-microsoft-exchange-zero-day-vulnerabilities/)[2](https://symantec.broadcom.com/hubfs/Attacks-Against-Government-Sector.pdf)

Windows Security Support Provider (SSP) DLLs are loaded into LSSAS process at system start. Once loaded into the LSA, SSP DLLs have access to encrypted and plaintext passwords that are stored in Windows, such as any logged-on user's Domain password or smart card PINs. The SSP configuration is stored in two Registry keys: `HKLM\SYSTEM\CurrentControlSet\Control\Lsa\Security Packages` and `HKLM\SYSTEM\CurrentControlSet\Control\Lsa\OSConfig\Security Packages`. An adversary may modify these Registry keys to add new SSPs, which will be loaded the next time the system boots, or when the AddSecurityPackage Windows API function is called.[3](http://docplayer.net/20839173-Analysis-of-malicious-security-support-provider-dlls.html)

The following SSPs can be used to access credentials:

-   Msv: Interactive logons, batch logons, and service logons are done through the MSV authentication package.
-   Wdigest: The Digest Authentication protocol is designed for use with Hypertext Transfer Protocol (HTTP) and Simple Authentication Security Layer (SASL) exchanges.[4](https://blogs.technet.microsoft.com/askpfeplat/2016/04/18/the-importance-of-kb2871997-and-kb2928120-for-credential-protection/)
-   Kerberos: Preferred for mutual client-server domain authentication in Windows 2000 and later.
-   CredSSP: Provides SSO and Network Level Authentication for Remote Desktop Services.[4](https://blogs.technet.microsoft.com/askpfeplat/2016/04/18/the-importance-of-kb2871997-and-kb2928120-for-credential-protection/)

#### Security Account Manager - T1003.002
[more on T1003.002](https://attack.mitre.org/techniques/T1003/002)

Adversaries may attempt to extract credential material from the Security Account Manager (SAM) database either through in-memory techniques or through the Windows Registry where the SAM database is stored. The SAM is a database file that contains local accounts for the host, typically those found with the `net user` command. Enumerating the SAM database requires SYSTEM level access.

A number of tools can be used to retrieve the SAM file through in-memory techniques:

-   pwdumpx.exe
-   [gsecdump](https://attack.mitre.org/software/S0008)
-   [Mimikatz](https://attack.mitre.org/software/S0002)
-   secretsdump.py

Alternatively, the SAM can be extracted from the Registry with Reg:

-   `reg save HKLM\sam sam`
-   `reg save HKLM\system system`

Creddump7 can then be used to process the SAM database locally to retrieve hashes.[1](https://github.com/Neohapsis/creddump7)

Notes: _RID 500 account is the local, built-in administrator._ RID 501 is the guest account.* User accounts start with a RID of 1,000+.

#### NTDS - T1003.003
[more on T1003.003](https://attack.mitre.org/techniques/T1003/003)

Adversaries may attempt to access or create a copy of the Active Directory domain database in order to steal credential information, as well as obtain other information about domain members such as devices, users, and access rights. By default, the NTDS file (NTDS.dit) is located in `%SystemRoot%\NTDS\Ntds.dit` of a domain controller.

In addition to looking for NTDS files on active Domain Controllers, attackers may search for backups that contain the same or similar information.[2](http://adsecurity.org/?p=1275)

The following tools and techniques can be used to enumerate the NTDS file and the contents of the entire Active Directory hashes.

-   Volume Shadow Copy
-   secretsdump.py
-   Using the in-built Windows tool, ntdsutil.exe
-   Invoke-NinjaCopy

#### LSA Secrets - T1003.004
[more on T1003.004](https://attack.mitre.org/techniques/T1003/004)

Adversaries with SYSTEM access to a host may attempt to access Local Security Authority (LSA) secrets, which can contain a variety of different credential materials, such as credentials for service accounts. LSA secrets are stored in the registry at `HKEY_LOCAL_MACHINE\SECURITY\Policy\Secrets`. LSA secrets can also be dumped from memory.

[Reg](https://attack.mitre.org/software/S0075) can be used to extract from the Registry. [Mimikatz](https://attack.mitre.org/software/S0002) can be used to extract secrets from memory.[4](https://ired.team/offensive-security/credential-access-and-credential-dumping/dumping-lsa-secrets)

#### Cached Domain Credentials - T1003.005
[more on T1003.005](https://attack.mitre.org/techniques/T1003/005)

Adversaries may attempt to access cached domain credentials used to allow authentication to occur in the event a domain controller is unavailable.[1](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/hh994565(v%3Dws.11))

On Windows Vista and newer, the hash format is DCC2 (Domain Cached Credentials version 2) hash, also known as MS-Cache v2 hash.[2](https://passlib.readthedocs.io/en/stable/lib/passlib.hash.msdcc2.html) The number of default cached credentials varies and can be altered per system. This hash does not allow pass-the-hash style attacks, and instead requires [[T1110_Brute Force#Password Cracking - T1110 002|Password Cracking (T1110.002)]] to recover the plaintext password.[3](https://ired.team/offensive-security/credential-access-and-credential-dumping/dumping-and-cracking-mscash-cached-domain-credentials)

With SYSTEM access, the tools/utilities such as [Mimikatz](https://attack.mitre.org/software/S0002), [Reg](https://attack.mitre.org/software/S0075), and secretsdump.py can be used to extract the cached credentials.

Note: Cached credentials for Windows Vista are derived using PBKDF2.[2](https://passlib.readthedocs.io/en/stable/lib/passlib.hash.msdcc2.html)

#### DCSync - T1003.006
[more on T1003.006](https://attack.mitre.org/techniques/T1003/006)

Adversaries may attempt to access credentials and other sensitive information by abusing a Windows Domain Controller's application programming interface (API)[1](https://msdn.microsoft.com/library/cc228086.aspx) [2](https://msdn.microsoft.com/library/dd207691.aspx) [3](https://wiki.samba.org/index.php/DRSUAPI) [4](https://source.winehq.org/WineAPI/samlib.html) to simulate the replication process from a remote domain controller using a technique called DCSync.

Members of the Administrators, Domain Admins, and Enterprise Admin groups or computer accounts on the domain controller are able to run DCSync to pull password data[5](https://adsecurity.org/?p=1729) from Active Directory, which may include current and historical hashes of potentially useful accounts such as KRBTGT and Administrators. The hashes can then in turn be used to create a [[T1558_Steal or Forge Kerberos Tickets#Golden Ticket - T1558 001|Golden Ticket (T1558.001)]] for use in [[T1550_Use Alternate Authentication Material#Pass the Ticket - T1550 003|Pass the Ticket (T1550.003)]][6](http://www.harmj0y.net/blog/redteaming/mimikatz-and-dcsync-and-extrasids-oh-my/) or change an account's password as noted in [[T1098_Account Manipulation|Account Manipulation (T1098)]].[7](https://blog.stealthbits.com/manipulating-user-passwords-with-mimikatz-SetNTLM-ChangeNTLM)

DCSync functionality has been included in the "lsadump" module in [Mimikatz](https://attack.mitre.org/software/S0002).[8](https://github.com/gentilkiwi/mimikatz/wiki/module-~-lsadump) Lsadump also includes NetSync, which performs DCSync over a legacy replication protocol.[9](https://msdn.microsoft.com/library/cc237008.aspx)

#### Proc Filesystem - T1003.007
[more on T1003.007](https://attack.mitre.org/techniques/T1003/007)

Adversaries may gather credentials from information stored in the Proc filesystem or `/proc`. The Proc filesystem on Linux contains a great deal of information regarding the state of the running operating system. Processes running with root privileges can use this facility to scrape live memory of other running programs. If any of these programs store passwords in clear text or password hashes in memory, these values can then be harvested for either usage or brute force attacks, respectively.

This functionality has been implemented in the MimiPenguin[1](https://github.com/huntergregal/mimipenguin), an open source tool inspired by Mimikatz. The tool dumps process memory, then harvests passwords and hashes by looking for text strings and regex patterns for how given applications such as Gnome Keyring, sshd, and Apache use memory to store such authentication artifacts.

#### /etc/passwd and /etc/shadow - T1003.008
[more on T1003.008](https://attack.mitre.org/techniques/T1003/008)

Adversaries may attempt to dump the contents of `/etc/passwd` and `/etc/shadow` to enable offline password cracking. Most modern Linux operating systems use a combination of `/etc/passwd` and `/etc/shadow` to store user account information including password hashes in `/etc/shadow`. By default, `/etc/shadow` is only readable by the root user.[1](https://www.tldp.org/LDP/lame/LAME/linux-admin-made-easy/shadow-file-formats.html)

The Linux utility, unshadow, can be used to combine the two files in a format suited for password cracking utilities such as John the Ripper:[2](https://www.cyberciti.biz/faq/unix-linux-password-cracking-john-the-ripper/) `# /usr/bin/unshadow /etc/passwd /etc/shadow > /tmp/crack.password.db`
