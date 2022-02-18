Tactics: [[PERSISTENCE]] - [[DEFENSE_EVASION]] - [[CREDENTIAL_ACCESS]]
Tags: #mitre/attack/techniques/T1556  

# Modify Authentication Process - T1556
---
## Description
[more on T1556](https://attack.mitre.org/techniques/T1556)

Adversaries may modify authentication mechanisms and processes to access user credentials or enable otherwise unwarranted access to accounts. The authentication process is handled by mechanisms, such as the Local Security Authentication Server (LSASS) process and the Security Accounts Manager (SAM) on Windows, pluggable authentication modules (PAM) on Unix-based systems, and authorization plugins on MacOS systems, responsible for gathering, storing, and validating credentials. By modifying an authentication process, an adversary may be able to authenticate to a service or system without using [[T1078_Valid Accounts|Valid Accounts (T1078)]].

Adversaries may maliciously modify a part of this process to either reveal credentials or bypass authentication mechanisms. Compromised credentials or access may be used to bypass access controls placed on various resources on systems within the network and may even be used for persistent access to remote systems and externally available services, such as VPNs, Outlook Web Access and remote desktop.

---
## Sub-Techniques

#### Domain Controller Authentication - T1556.001
[more on T1556.001](https://attack.mitre.org/techniques/T1556/001)

Adversaries may patch the authentication process on a domain controller to bypass the typical authentication mechanisms and enable access to accounts.

Malware may be used to inject false credentials into the authentication process on a domain controller with the intent of creating a backdoor used to access any user’s account and/or credentials (ex: [Skeleton Key](https://attack.mitre.org/software/S0007)). Skeleton key works through a patch on an enterprise domain controller authentication process (LSASS) with credentials that adversaries may use to bypass the standard authentication system. Once patched, an adversary can use the injected password to successfully authenticate as any domain user account (until the the skeleton key is erased from memory by a reboot of the domain controller). Authenticated access may enable unfettered access to hosts and/or resources within single-factor authentication environments.[1](https://www.secureworks.com/research/skeleton-key-malware-analysis)

#### Password Filter DLL - T1556.002
[more on T1556.002](https://attack.mitre.org/techniques/T1556/002)

Adversaries may register malicious password filter dynamic link libraries (DLLs) into the authentication process to acquire user credentials as they are validated.

Windows password filters are password policy enforcement mechanisms for both domain and local accounts. Filters are implemented as DLLs containing a method to validate potential passwords against password policies. Filter DLLs can be positioned on local computers for local accounts and/or domain controllers for domain accounts. Before registering new passwords in the Security Accounts Manager (SAM), the Local Security Authority (LSA) requests validation from each registered filter. Any potential changes cannot take effect until every registered filter acknowledges validation.

Adversaries can register malicious password filters to harvest credentials from local computers and/or entire domains. To perform proper validation, filters must receive plain-text credentials from the LSA. A malicious password filter would receive these plain-text credentials every time a password request is made.[1](http://carnal0wnage.attackresearch.com/2013/09/stealing-passwords-every-time-they.html)

#### Pluggable Authentication Modules - T1556.003
[more on T1556.003](https://attack.mitre.org/techniques/T1556/003)

Adversaries may modify pluggable authentication modules (PAM) to access user credentials or enable otherwise unwarranted access to accounts. PAM is a modular system of configuration files, libraries, and executable files which guide authentication for many services. The most common authentication module is `pam_unix.so`, which retrieves, sets, and verifies account authentication information in `/etc/passwd` and `/etc/shadow`.[1](https://opensource.apple.com/source/dovecot/dovecot-239/dovecot/doc/wiki/PasswordDatabase.PAM.txt)[2](https://linux.die.net/man/8/pam_unix)[3](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/managing_smart_cards/pluggable_authentication_modules)

Adversaries may modify components of the PAM system to create backdoors. PAM components, such as `pam_unix.so`, can be patched to accept arbitrary adversary supplied values as legitimate credentials.[4](https://github.com/zephrax/linux-pam-backdoor)

Malicious modifications to the PAM system may also be abused to steal credentials. Adversaries may infect PAM resources with code to harvest user credentials, since the values exchanged with PAM components may be plain-text since PAM does not store passwords.[5](https://x-c3ll.github.io/posts/PAM-backdoor-DNS/)[1](https://opensource.apple.com/source/dovecot/dovecot-239/dovecot/doc/wiki/PasswordDatabase.PAM.txt)

#### Network Device Authentication - T1556.004
[more on T1556.004](https://attack.mitre.org/techniques/T1556/004)

Adversaries may use [[T1601_Modify System Image#Patch System Image - T1601 001|Patch System Image (T1601.001)]] to hard code a password in the operating system, thus bypassing of native authentication mechanisms for local accounts on network devices.

[[T1601_Modify System Image|Modify System Image (T1601)]] may include implanted code to the operating system for network devices to provide access for adversaries using a specific password. The modification includes a specific password which is implanted in the operating system image via the patch. Upon authentication attempts, the inserted code will first check to see if the user input is the password. If so, access is granted. Otherwise, the implanted code will pass the credentials on for verification of potentially valid credentials.[1](https://www.fireeye.com/blog/threat-research/2015/09/synful_knock_-_acis.html)



