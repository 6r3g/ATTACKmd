Tactics: [[CREDENTIAL_ACCESS]]
Tags: #mitre/attack/techniques/T1558  

# Steal or Forge Kerberos Tickets - T1558
---
## Description
[more on T1558](https://attack.mitre.org/techniques/T1558)

Adversaries may attempt to subvert Kerberos authentication by stealing or forging Kerberos tickets to enable [[T1550_Use Alternate Authentication Material#Pass the Ticket - T1550 003|Pass the Ticket (T1550.003)]]. Kerberos is an authentication protocol widely used in modern Windows domain environments. In Kerberos environments, referred to as "realms", there are three basic participants: client, service, and Key Distribution Center (KDC).[1](https://adsecurity.org/?p=227) Clients request access to a service and through the exchange of Kerberos tickets, originating from KDC, they are granted access after having successfully authenticated. The KDC is responsible for both authentication and ticket granting. Attackers may attempt to abuse Kerberos by stealing tickets or forging tickets to enable unauthorized access.

On Windows, the built-in `klist` utility can be used to list and analyze cached Kerberos tickets.[2](https://docs.microsoft.com/windows-server/administration/windows-commands/klist)

Linux systems on Active Directory domains store Kerberos credentials locally in the credential cache file referred to as the "ccache". The credentials are stored in the ccache file while they remain valid and generally while a user's session lasts.[3](https://web.mit.edu/kerberos/krb5-1.12/doc/basic/ccache_def.html) On modern Redhat Enterprise Linux systems, and derivative distributions, the System Security Services Daemon (SSSD) handles Kerberos tickets. By default SSSD maintains a copy of the ticket database that can be found in `/var/lib/sss/secrets/secrets.ldb` as well as the corresponding key located in `/var/lib/sss/secrets/.secrets.mkey`. Both files require root access to read. If an adversary is able to access the database and key, the credential cache Kerberos blob can be extracted and converted into a usable Kerberos ccache file that adversaries may use for [[T1550_Use Alternate Authentication Material#Pass the Ticket - T1550 003|Pass the Ticket (T1550.003)]]. The ccache file may also be converted into a Windows format using tools such as Kekeo.[4](https://www.fireeye.com/blog/threat-research/2020/04/kerberos-tickets-on-linux-red-teams.html)[5](https://labs.portcullis.co.uk/download/eu-18-Wadhwa-Brown-Where-2-worlds-collide-Bringing-Mimikatz-et-al-to-UNIX.pdf)[6](https://github.com/gentilkiwi/kekeo)

Kerberos tickets on macOS are stored in a standard ccache format, similar to Linux. By default, access to these ccache entries is federated through the KCM daemon process via the Mach RPC protocol, which uses the caller's environment to determine access. The storage location for these ccache entries is influenced by the `/etc/krb5.conf` configuration file and the `KRB5CCNAME` environment variable which can specify to save them to disk or keep them protected via the KCM daemon. Users can interact with ticket storage using `kinit`, `klist`, `ktutil`, and `kcc` built-in binaries or via Apple's native Kerberos framework. Adversaries can use open source tools to interact with the ccache files directly or to use the Kerberos framework to call lower-level APIs for extracting the user's TGT or Service Tickets.[7](https://posts.specterops.io/when-kirbi-walks-the-bifrost-4c727807744f)[8](http://web.mit.edu/macdev/KfM/Common/Documentation/preferences.html)

---
## Sub-Techniques

#### Golden Ticket - T1558.001
[more on T1558.001](https://attack.mitre.org/techniques/T1558/001)

Adversaries who have the KRBTGT account password hash may forge Kerberos ticket-granting tickets (TGT), also known as a golden ticket.[1](https://adsecurity.org/?p=1640) Golden tickets enable adversaries to generate authentication material for any account in Active Directory.[2](https://cert.europa.eu/static/WhitePapers/UPDATED%20-%20CERT-EU_Security_Whitepaper_2014-007_Kerberos_Golden_Ticket_Protection_v1_4.pdf)

Using a golden ticket, adversaries are then able to request ticket granting service (TGS) tickets, which enable access to specific resources. Golden tickets require adversaries to interact with the Key Distribution Center (KDC) in order to obtain TGS.[3](https://adsecurity.org/?p=1515)

The KDC service runs all on domain controllers that are part of an Active Directory domain. KRBTGT is the Kerberos Key Distribution Center (KDC) service account and is responsible for encrypting and signing all Kerberos tickets.[4](https://adsecurity.org/?p=483) The KRBTGT password hash may be obtained using [[T1003_OS Credential Dumping|OS Credential Dumping (T1003)]] and privileged access to a domain controller.

#### Silver Ticket - T1558.002
[more on T1558.002](https://attack.mitre.org/techniques/T1558/002)

Adversaries who have the password hash of a target service account (e.g. SharePoint, MSSQL) may forge Kerberos ticket granting service (TGS) tickets, also known as silver tickets. Kerberos TGS tickets are also known as service tickets.[1](https://adsecurity.org/?p=2011)

Silver tickets are more limited in scope in than golden tickets in that they only enable adversaries to access a particular resource (e.g. MSSQL) and the system that hosts the resource; however, unlike golden tickets, adversaries with the ability to forge silver tickets are able to create TGS tickets without interacting with the Key Distribution Center (KDC), potentially making detection more difficult.[2](https://adsecurity.org/?p=1515)

Password hashes for target services may be obtained using [[T1003_OS Credential Dumping|OS Credential Dumping (T1003)]] or [[T1558_Steal or Forge Kerberos Tickets#Kerberoasting - T1558 003|Kerberoasting (T1558.003)]].

#### Kerberoasting - T1558.003
[more on T1558.003](https://attack.mitre.org/techniques/T1558/003)

Adversaries may abuse a valid Kerberos ticket-granting ticket (TGT) or sniff network traffic to obtain a ticket-granting service (TGS) ticket that may be vulnerable to [[T1110_Brute Force|Brute Force (T1110)]].[1](https://github.com/EmpireProject/Empire/blob/master/data/module_source/credentials/Invoke-Kerberoast.ps1)[2](https://adsecurity.org/?p=2293)

Service principal names (SPNs) are used to uniquely identify each instance of a Windows service. To enable authentication, Kerberos requires that SPNs be associated with at least one service logon account (an account specifically tasked with running a service[3](https://blogs.technet.microsoft.com/motiba/2018/02/23/detecting-kerberoasting-activity-using-azure-security-center/)).[4](https://msdn.microsoft.com/library/ms677949.aspx)[5](https://social.technet.microsoft.com/wiki/contents/articles/717.service-principal-names-spns-setspn-syntax-setspn-exe.aspx)[6](https://redsiege.com/kerberoast-slides)[7](https://www.harmj0y.net/blog/powershell/kerberoasting-without-mimikatz/)

Adversaries possessing a valid Kerberos ticket-granting ticket (TGT) may request one or more Kerberos ticket-granting service (TGS) service tickets for any SPN from a domain controller (DC).[1](https://github.com/EmpireProject/Empire/blob/master/data/module_source/credentials/Invoke-Kerberoast.ps1)[2](https://adsecurity.org/?p=2293) Portions of these tickets may be encrypted with the RC4 algorithm, meaning the Kerberos 5 TGS-REP etype 23 hash of the service account associated with the SPN is used as the private key and is thus vulnerable to offline [[T1110_Brute Force|Brute Force (T1110)]] attacks that may expose plaintext credentials.[2](https://adsecurity.org/?p=2293)[1](https://github.com/EmpireProject/Empire/blob/master/data/module_source/credentials/Invoke-Kerberoast.ps1) [7](https://www.harmj0y.net/blog/powershell/kerberoasting-without-mimikatz/)

This same attack could be executed using service tickets captured from network traffic.[2](https://adsecurity.org/?p=2293)

Cracked hashes may enable [Persistence](https://attack.mitre.org/tactics/TA0003), [Privilege Escalation](https://attack.mitre.org/tactics/TA0004), and [Lateral Movement](https://attack.mitre.org/tactics/TA0008) via access to [[T1078_Valid Accounts|Valid Accounts (T1078)]].[6](https://redsiege.com/kerberoast-slides)

#### AS-REP Roasting - T1558.004
[more on T1558.004](https://attack.mitre.org/techniques/T1558/004)

Adversaries may reveal credentials of accounts that have disabled Kerberos preauthentication by [[T1110_Brute Force#Password Cracking - T1110 002|Password Cracking (T1110.002)]] Kerberos messages.[1](http://www.harmj0y.net/blog/activedirectory/roasting-as-reps/)

Preauthentication offers protection against offline [[T1110_Brute Force#Password Cracking - T1110 002|Password Cracking (T1110.002)]]. When enabled, a user requesting access to a resource initiates communication with the Domain Controller (DC) by sending an Authentication Server Request (AS-REQ) message with a timestamp that is encrypted with the hash of their password. If and only if the DC is able to successfully decrypt the timestamp with the hash of the user’s password, it will then send an Authentication Server Response (AS-REP) message that contains the Ticket Granting Ticket (TGT) to the user. Part of the AS-REP message is signed with the user’s password.[2](https://social.technet.microsoft.com/wiki/contents/articles/23559.kerberos-pre-authentication-why-it-should-not-be-disabled.aspx)

For each account found without preauthentication, an adversary may send an AS-REQ message without the encrypted timestamp and receive an AS-REP message with TGT data which may be encrypted with an insecure algorithm such as RC4. The recovered encrypted data may be vulnerable to offline [[T1110_Brute Force#Password Cracking - T1110 002|Password Cracking (T1110.002)]] attacks similarly to [[T1558_Steal or Forge Kerberos Tickets#Kerberoasting - T1558 003|Kerberoasting (T1558.003)]] and expose plaintext credentials. [1](http://www.harmj0y.net/blog/activedirectory/roasting-as-reps/)[3](https://blog.stealthbits.com/cracking-active-directory-passwords-with-as-rep-roasting/)

An account registered to a domain, with or without special privileges, can be abused to list all domain accounts that have preauthentication disabled by utilizing Windows tools like [[T1059_Command and Scripting Interpreter#PowerShell - T1059 001|PowerShell (T1059.001)]] with an LDAP filter. Alternatively, the adversary may send an AS-REQ message for each user. If the DC responds without errors, the account does not require preauthentication and the AS-REP message will already contain the encrypted data. [1](http://www.harmj0y.net/blog/activedirectory/roasting-as-reps/)[3](https://blog.stealthbits.com/cracking-active-directory-passwords-with-as-rep-roasting/)

Cracked hashes may enable [Persistence](https://attack.mitre.org/tactics/TA0003), [Privilege Escalation](https://attack.mitre.org/tactics/TA0004), and [Lateral Movement](https://attack.mitre.org/tactics/TA0008) via access to [[T1078_Valid Accounts|Valid Accounts (T1078)]].[4](https://redsiege.com/kerberoast-slides)



