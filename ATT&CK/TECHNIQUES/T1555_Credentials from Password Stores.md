Tactics: [[CREDENTIAL_ACCESS]]
Tags: #mitre/attack/techniques/T1555  

# Creadentials from Password Stores - T1555
---
## Description
[more on T1555](https://attack.mitre.org/techniques/T1555)

Adversaries may search for common password storage locations to obtain user credentials. Passwords are stored in several places on a system, depending on the operating system or application holding the credentials. There are also specific applications that store passwords to make it easier for users manage and maintain. Once credentials are obtained, they can be used to perform lateral movement and access restricted information.

---
## Sub-Techniques

#### Keychain - T1555.001
[more on T1555.001](https://attack.mitre.org/techniques/T1555/001)

Adversaries may collect the keychain storage data from a system to acquire credentials. Keychains are the built-in way for macOS to keep track of users' passwords and credentials for many services and features such as WiFi passwords, websites, secure notes, certificates, and Kerberos. Keychain files are located in `~/Library/Keychains/`,`/Library/Keychains/`, and `/Network/Library/Keychains/`. [1](https://en.wikipedia.org/wiki/Keychain_(software)) The `security` command-line utility, which is built into macOS by default, provides a useful way to manage these credentials.

To manage their credentials, users have to use additional credentials to access their keychain. If an adversary knows the credentials for the login keychain, then they can get access to all the other credentials stored in this vault. [2](http://www.slideshare.net/StephanBorosh/external-to-da-the-os-x-way) By default, the passphrase for the keychain is the user’s logon credentials.

#### Securityd Memory - T1555.002
[more on T1555.002](https://attack.mitre.org/techniques/T1555/002)

An adversary may obtain root access (allowing them to read securityd’s memory), then they can scan through memory to find the correct sequence of keys in relatively few tries to decrypt the user’s logon keychain. This provides the adversary with all the plaintext passwords for users, WiFi, mail, browsers, certificates, secure notes, etc.[1](http://juusosalonen.com/post/30923743427/breaking-into-the-os-x-keychain) [2](https://www.welivesecurity.com/2016/07/06/new-osxkeydnap-malware-hungry-credentials/)

In OS X prior to El Capitan, users with root access can read plaintext keychain passwords of logged-in users because Apple’s keychain implementation allows these credentials to be cached so that users are not repeatedly prompted for passwords. [1](http://juusosalonen.com/post/30923743427/breaking-into-the-os-x-keychain) [3](http://www.slideshare.net/StephanBorosh/external-to-da-the-os-x-way) Apple’s securityd utility takes the user’s logon password, encrypts it with PBKDF2, and stores this master key in memory. Apple also uses a set of keys and algorithms to encrypt the user’s password, but once the master key is found, an attacker need only iterate over the other values to unlock the final password.[1](http://juusosalonen.com/post/30923743427/breaking-into-the-os-x-keychain)

#### Credentials from Web Browsers - T1555.003
[more on T1555.003](https://attack.mitre.org/techniques/T1555/003)

Adversaries may acquire credentials from web browsers by reading files specific to the target browser.[1](https://blog.talosintelligence.com/2018/02/olympic-destroyer.html) Web browsers commonly save credentials such as website usernames and passwords so that they do not need to be entered manually in the future. Web browsers typically store the credentials in an encrypted format within a credential store; however, methods exist to extract plaintext credentials from web browsers.

For example, on Windows systems, encrypted credentials may be obtained from Google Chrome by reading a database file, `AppData\Local\Google\Chrome\User Data\Default\Login Data` and executing a SQL query: `SELECT action_url, username_value, password_value FROM logins;`. The plaintext password can then be obtained by passing the encrypted credentials to the Windows API function `CryptUnprotectData`, which uses the victim’s cached logon credentials as the decryption key. [2](https://docs.microsoft.com/en-us/windows/desktop/api/dpapi/nf-dpapi-cryptunprotectdata)

Adversaries have executed similar procedures for common web browsers such as FireFox, Safari, Edge, etc.[3](https://www.proofpoint.com/us/threat-insight/post/new-vega-stealer-shines-brightly-targeted-campaign)[4](https://www.fireeye.com/blog/threat-research/2017/07/hawkeye-malware-distributed-in-phishing-campaign.html) Windows stores Internet Explorer and Microsoft Edge credentials in Credential Lockers managed by the [[T1555_Credentials from Password Stores#Windows Credentials Manager - T1555 004|Windows Credential Manager (T1555.004)]].

Adversaries may also acquire credentials by searching web browser process memory for patterns that commonly match credentials.[5](https://github.com/putterpanda/mimikittenz)

After acquiring credentials from web browsers, adversaries may attempt to recycle the credentials across different systems and/or accounts in order to expand access. This can result in significantly furthering an adversary's objective in cases where credentials gained from web browsers overlap with privileged accounts (e.g. domain administrator).

#### Windows Credentials Manager - T1555.004
[more on T1555.004](https://attack.mitre.org/techniques/T1555/004)

Adversaries may acquire credentials from the Windows Credential Manager. The Credential Manager stores credentials for signing into websites, applications, and/or devices that request authentication through NTLM or Kerberos in Credential Lockers (previously known as Windows Vaults).[1](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/hh994565(v=ws.11)#credential-manager-store)[2](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-8.1-and-8/jj554668(v=ws.11)?redirectedfrom=MSDN)

The Windows Credential Manager separates website credentials from application or network credentials in two lockers. As part of [[T1555_Credentials from Password Stores#Credentials from Web Browsers - T1555 003|Credentials from Web Browsers (T1555.003)]], Internet Explorer and Microsoft Edge website credentials are managed by the Credential Manager and are stored in the Web Credentials locker. Application and network credentials are stored in the Windows Credentials locker.

Credential Lockers store credentials in encrypted `.vcrd` files, located under `%Systemdrive%\Users\[Username]\AppData\Local\Microsoft\[Vault/Credentials]\`. The encryption key can be found in a file named `Policy.vpol`, typically located in the same folder as the credentials.[3](https://www.passcape.com/windows_password_recovery_vault_explorer)[4](https://blog.malwarebytes.com/101/2016/01/the-windows-vaults/)

Adversaries may list credentials managed by the Windows Credential Manager through several mechanisms. `vaultcmd.exe` is a native Windows executable that can be used to enumerate credentials stored in the Credential Locker through a command-line interface. Adversaries may gather credentials by reading files located inside of the Credential Lockers. Adversaries may also abuse Windows APIs such as `CredEnumerateA` to list credentials managed by the Credential Manager.[5](https://docs.microsoft.com/en-us/windows/win32/api/wincred/nf-wincred-credenumeratea)[6](https://github.com/gentilkiwi/mimikatz/wiki/howto-~-credential-manager-saved-credentials)

Adversaries may use password recovery tools to obtain plain text passwords from the Credential Manager.[4](https://blog.malwarebytes.com/101/2016/01/the-windows-vaults/)

#### Password Managers - T1555.005
[more on T1555.005](https://attack.mitre.org/techniques/T1555/005)

Adversaries may acquire user credentials from third-party password managers.[1](https://www.ise.io/casestudies/password-manager-hacking/) Password managers are applications designed to store user credentials, normally in an encrypted database. Credentials are typically accessible after a user provides a master password that unlocks the database. After the database is unlocked, these credentials may be copied to memory. These databases can be stored as files on disk.[1](https://www.ise.io/casestudies/password-manager-hacking/)

Adversaries may acquire user credentials from password managers by extracting the master password and/or plain-text credentials from memory.[2](https://resources.fox-it.com/rs/170-CAK-271/images/201912_Report_Operation_Wocao.pdf)[3](https://github.com/GhostPack/KeeThief) Adversaries may extract credentials from memory via [[T1212_Exploitation for Credential Access|Exploitation for Credential Access (T1212)]].[4](https://nvd.nist.gov/vuln/detail/CVE-2019-3610) Adversaries may also try brute forcing via [[T1110_Brute Force#Password Guessing - T1110 001|Password Guessing (T1110.001)]] to obtain the master password of a password manager.[5](https://www.cybereason.com/blog/dropping-anchor-from-a-trickbot-infection-to-the-discovery-of-the-anchor-malware)

#### Cloud Secrets Management Stores - T1555.006
[more on T1555.006](https://attack.mitre.org/techniques/T1555/006)

Adversaries may acquire credentials from cloud-native secret management solutions such as AWS Secrets Manager, GCP Secret Manager, Azure Key Vault, and Terraform Vault.

Secrets managers support the secure centralized management of passwords, API keys, and other credential material. Where secrets managers are in use, cloud services can dynamically acquire credentials via API requests rather than accessing secrets insecurely stored in plain text files or environment variables.

If an adversary is able to gain sufficient privileges in a cloud environment – for example, by obtaining the credentials of high-privileged [[T1078_Valid Accounts#Cloud Accounts - T1078.004|Cloud Accounts]] or compromising a service that has permission to retrieve secrets – they may be able to request secrets from the secrets manager. This can be accomplished via commands such as `get-secret-value` in AWS, `gcloud secrets describe` in GCP, and `az key vault secret show` in Azure. [1](https://permiso.io/blog/lucr-3-scattered-spider-getting-saas-y-in-the-cloud) [2](https://sysdig.com/blog/scarleteel-2-0/) [3](https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieving-secrets.html) [4](https://cloud.google.com/secret-manager/docs/view-secret-details) [5](https://learn.microsoft.com/en-us/azure/key-vault/secrets/quick-create-cli)

**Note:** this technique is distinct from [[T1552_Unsecured Credentials#Cloud Instance Metadata API - T1552.005|Cloud Instance Metadata API]] in that the credentials are being directly requested from the cloud secrets manager, rather than through the medium of the instance metadata API.

