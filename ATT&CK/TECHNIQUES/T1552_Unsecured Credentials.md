Tactics: [[CREDENTIAL_ACCESS]]
Tags: #mitre/attack/techniques/T1552  

# Unsecured Credentials - T1552
---
## Description
[more on T1552](https://attack.mitre.org/techniques/T1552)

Adversaries may search compromised systems to find and obtain insecurely stored credentials. These credentials can be stored and/or misplaced in many locations on a system, including plaintext files (e.g. [[T1552_Unsecured Credentials#Bash History - T1552 003|Bash History (T1552.003)]]), operating system or application-specific repositories (e.g. [[T1552_Unsecured Credentials#Credentials in Registry - T1552 002|Credentials in Registry (T1552.002)]]), or other specialized files/artifacts (e.g. [[T1552_Unsecured Credentials#Private Keys - T1552 004|Private Keys (T1552.004)]]).

---
## Sub-Techniques

#### Credentials In Files - T1552.001
[more on T1552.001](https://attack.mitre.org/techniques/T1552/001)

Adversaries may search local file systems and remote file shares for files containing insecurely stored credentials. These can be files created by users to store their own credentials, shared credential stores for a group of individuals, configuration files containing passwords for a system or service, or source code/binary files containing embedded passwords.

It is possible to extract passwords from backups or saved virtual machines through [[T1003_OS Credential Dumping|OS Credential Dumping (T1003)]]. [1](http://carnal0wnage.attackresearch.com/2014/05/mimikatz-against-virtual-machine-memory.html) Passwords may also be obtained from Group Policy Preferences stored on the Windows Domain Controller. [2](http://blogs.technet.com/b/srd/archive/2014/05/13/ms14-025-an-update-for-group-policy-preferences.aspx)

In cloud and/or containerized environments, authenticated user and service account credentials are often stored in local configuration and credential files.[3](https://unit42.paloaltonetworks.com/hildegard-malware-teamtnt/) They may also be found as parameters to deployment commands in container logs.[4](https://unit42.paloaltonetworks.com/attackers-tactics-and-techniques-in-unsecured-docker-daemons-revealed/) In some cases, these files can be copied and reused on another machine or the contents can be read and then used to authenticate without needing to copy any files.[5](https://posts.specterops.io/head-in-the-clouds-bd038bb69e48)

#### Credentials in Registry - T1552.002
[more on T1552.002](https://attack.mitre.org/techniques/T1552/002)

Adversaries may search the Registry on compromised systems for insecurely stored credentials. The Windows Registry stores configuration information that can be used by the system or other programs. Adversaries may query the Registry looking for credentials and passwords that have been stored for use by other programs or services. Sometimes these credentials are used for automatic logons.

Example commands to find Registry keys related to password information: [1](https://pentestlab.blog/2017/04/19/stored-credentials/)

-   Local Machine Hive: `reg query HKLM /f password /t REG_SZ /s`
-   Current User Hive: `reg query HKCU /f password /t REG_SZ /s`

#### Bash History - T1552.003
[more on T1552.003](https://attack.mitre.org/techniques/T1552/003)

Adversaries may search the bash command history on compromised systems for insecurely stored credentials. Bash keeps track of the commands users type on the command-line with the "history" utility. Once a user logs out, the history is flushed to the user’s `.bash_history` file. For each user, this file resides at the same location: `~/.bash_history`. Typically, this file keeps track of the user’s last 500 commands. Users often type usernames and passwords on the command-line as parameters to programs, which then get saved to this file when they log out. Attackers can abuse this by looking through the file for potential credentials. [1](http://www.slideshare.net/StephanBorosh/external-to-da-the-os-x-way)

#### Private Keys - T1552.004
[more on T1552.004](https://attack.mitre.org/techniques/T1552/004)

Adversaries may search for private key certificate files on compromised systems for insecurely stored credentials. Private cryptographic keys and certificates are used for authentication, encryption/decryption, and digital signatures.[1](https://en.wikipedia.org/wiki/Public-key_cryptography) Common key and certificate file extensions include: .key, .pgp, .gpg, .ppk., .p12, .pem, .pfx, .cer, .p7b, .asc.

Adversaries may also look in common key directories, such as `~/.ssh` for SSH keys on * nix-based systems or `C:\Users\(username)\.ssh\` on Windows. These private keys can be used to authenticate to [[T1021_Remote Services|Remote Services (T1021)]] like SSH or for use in decrypting other collected files such as email.

Adversary tools have been discovered that search compromised systems for file extensions relating to cryptographic keys and certificates.[2](https://kasperskycontenthub.com/wp-content/uploads/sites/43/vlpdfs/unveilingthemask_v1.0.pdf)[3](https://researchcenter.paloaltonetworks.com/2016/06/unit42-prince-of-persia-game-over/)

Some private keys require a password or passphrase for operation, so an adversary may also use [[T1056_Input Capture|Input Capture (T1056)]] for keylogging or attempt to [[T1110_Brute Force|Brute Force (T1110)]] the passphrase off-line.

#### Cloud Instance Metadata API - T1552.005
[more on T1552.005](https://attack.mitre.org/techniques/T1552/005)

Adversaries may attempt to access the Cloud Instance Metadata API to collect credentials and other sensitive data.

Most cloud service providers support a Cloud Instance Metadata API which is a service provided to running virtual instances that allows applications to access information about the running virtual instance. Available information generally includes name, security group, and additional metadata including sensitive data such as credentials and UserData scripts that may contain additional secrets. The Instance Metadata API is provided as a convenience to assist in managing applications and is accessible by anyone who can access the instance.[1](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html) A cloud metadata API has been used in at least one high profile compromise.[2](https://krebsonsecurity.com/2019/08/what-we-can-learn-from-the-capital-one-hack/)

If adversaries have a presence on the running virtual instance, they may query the Instance Metadata API directly to identify credentials that grant access to additional resources. Additionally, attackers may exploit a Server-Side Request Forgery (SSRF) vulnerability in a public facing web proxy that allows the attacker to gain access to the sensitive information via a request to the Instance Metadata API.[3](https://redlock.io/blog/instance-metadata-api-a-modern-day-trojan-horse)

The de facto standard across cloud service providers is to host the Instance Metadata API at `http[:]//169.254.169.254`.

#### Group Policy Preferences - T1552.006
[more on T1552.006](https://attack.mitre.org/techniques/T1552/006)

Adversaries may attempt to find unsecured credentials in Group Policy Preferences (GPP). GPP are tools that allow administrators to create domain policies with embedded credentials. These policies allow administrators to set local accounts.[1](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/dn581922(v%3Dws.11))

These group policies are stored in SYSVOL on a domain controller. This means that any domain user can view the SYSVOL share and decrypt the password (using the AES key that has been made public).[2](https://msdn.microsoft.com/library/cc422924.aspx)

The following tools and scripts can be used to gather and decrypt the password file from Group Policy Preference XML files:

-   Metasploit’s post exploitation module: `post/windows/gather/credentials/gpp`
-   Get-GPPPassword[3](https://obscuresecurity.blogspot.co.uk/2012/05/gpp-password-retrieval-with-powershell.html)
-   gpprefdecrypt.py

On the SYSVOL share, adversaries may use the following command to enumerate potential GPP XML files: `dir /s * .xml`

#### Container API - T1552.007
[more on T1552.007](https://attack.mitre.org/techniques/T1552/007)

Adversaries may gather credentials via APIs within a containers environment. APIs in these environments, such as the Docker API and Kubernetes APIs, allow a user to remotely manage their container resources and cluster components.[1](https://docs.docker.com/engine/api/v1.41/)[2](https://kubernetes.io/docs/concepts/overview/kubernetes-api/)

An adversary may access the Docker API to collect logs that contain credentials to cloud, container, and various other resources in the environment.[3](https://unit42.paloaltonetworks.com/attackers-tactics-and-techniques-in-unsecured-docker-daemons-revealed/) An adversary with sufficient permissions, such as via a pod's service account, may also use the Kubernetes API to retrieve credentials from the Kubernetes API server. These credentials may include those needed for Docker API authentication or secrets from Kubernetes cluster components.



