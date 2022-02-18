Tactics: [[DISCOVERY]]
Tags: #mitre/attack/techniques/T1087  

# Account Discovery - T1087
---
## Description
[more on T1087](https://attack.mitre.org/techniques/T1087)

Adversaries may attempt to get a listing of accounts on a system or within an environment. This information can help adversaries determine which accounts exist to aid in follow-on behavior.

---
## Sub-Techniques

#### Local Account - T1087.001
[more on T1087.001](https://attack.mitre.org/techniques/T1087/001)

Adversaries may attempt to get a listing of local system accounts. This information can help adversaries determine which local accounts exist on a system to aid in follow-on behavior.

Commands such as `net user` and `net localgroup` of the [Net](https://attack.mitre.org/software/S0039) utility and `id` and `groups`on macOS and Linux can list local users and groups. On Linux, local users can also be enumerated through the use of the `/etc/passwd` file. On macOS the `dscl . list /Users` command can be used to enumerate local accounts.

#### Domain Account - T1087.002
[more on T1087.002](https://attack.mitre.org/techniques/T1087/002)

Adversaries may attempt to get a listing of domain accounts. This information can help adversaries determine which domain accounts exist to aid in follow-on behavior.

Commands such as `net user /domain` and `net group /domain` of the [Net](https://attack.mitre.org/software/S0039) utility, `dscacheutil -q group`on macOS, and `ldapsearch` on Linux can list domain users and groups.

#### Email Account - T1087.003
[more on T1087.003](https://attack.mitre.org/techniques/T1087/003)

Adversaries may attempt to get a listing of email addresses and accounts. Adversaries may try to dump Exchange address lists such as global address lists (GALs).[1](https://docs.microsoft.com/en-us/exchange/email-addresses-and-address-books/address-lists/address-lists?view=exchserver-2019)

In on-premises Exchange and Exchange Online, the`Get-GlobalAddressList` PowerShell cmdlet can be used to obtain email addresses and accounts from a domain using an authenticated session.[2](https://docs.microsoft.com/en-us/powershell/module/exchange/email-addresses-and-address-books/get-globaladdresslist)[3](https://www.blackhillsinfosec.com/attacking-exchange-with-mailsniper/)

In Google Workspace, the GAL is shared with Microsoft Outlook users through the Google Workspace Sync for Microsoft Outlook (GWSMO) service. Additionally, the Google Workspace Directory allows for users to get a listing of other users within the organization.[4](https://support.google.com/a/answer/166870?hl=en)

#### Cloud Account - T1087.004
[more on T1087.004](https://attack.mitre.org/techniques/T1087/004)

Adversaries may attempt to get a listing of cloud accounts. Cloud accounts are those created and configured by an organization for use by users, remote support, services, or for administration of resources within a cloud service provider or SaaS application.

With authenticated access there are several tools that can be used to find accounts. The `Get-MsolRoleMember` PowerShell cmdlet can be used to obtain account names given a role or permissions group in Office 365.[1](https://docs.microsoft.com/en-us/powershell/module/msonline/get-msolrolemember?view=azureadps-1.0)[2](https://github.com/True-Demon/raindance) The Azure CLI (AZ CLI) also provides an interface to obtain user accounts with authenticated access to a domain. The command `az ad user list` will list all users within a domain.[3](https://docs.microsoft.com/en-us/cli/azure/ad/user?view=azure-cli-latest)[4](https://www.blackhillsinfosec.com/red-teaming-microsoft-part-1-active-directory-leaks-via-azure/)

The AWS command `aws iam list-users` may be used to obtain a list of users in the current account while `aws iam list-roles` can obtain IAM roles that have a specified path prefix.[5](https://docs.aws.amazon.com/cli/latest/reference/iam/list-roles.html)[6](https://docs.aws.amazon.com/cli/latest/reference/iam/list-users.html) In GCP, `gcloud iam service-accounts list` and `gcloud projects get-iam-policy` may be used to obtain a listing of service accounts and users in a project.[7](https://cloud.google.com/sdk/gcloud/reference/iam/service-accounts/list)


