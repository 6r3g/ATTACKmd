Tactics: [[DISCOVERY]]
Tags: #mitre/attack/techniques/T1069  

# Permission Groups Discovery - T1069
---
## Description
[more on T1069](https://attack.mitre.org/techniques/T1069)

Adversaries may attempt to find group and permission settings. This information can help adversaries determine which user accounts and groups are available, the membership of users in particular groups, and which users and groups have elevated permissions.

---
## Sub-Techniques

#### Local Groups - T1069.001
[more on T1069.001](https://attack.mitre.org/techniques/T1069/001)

Adversaries may attempt to find local system groups and permission settings. The knowledge of local system permission groups can help adversaries determine which groups exist and which users belong to a particular group. Adversaries may use this information to determine which users have elevated permissions, such as the users found within the local administrators group.

Commands such as `net localgroup` of the [Net](https://attack.mitre.org/software/S0039) utility, `dscl . -list /Groups` on macOS, and `groups` on Linux can list local groups.

#### Domain Groups - T1069.002
[more on T1069.002](https://attack.mitre.org/techniques/T1069/002)

Adversaries may attempt to find domain-level groups and permission settings. The knowledge of domain-level permission groups can help adversaries determine which groups exist and which users belong to a particular group. Adversaries may use this information to determine which users have elevated permissions, such as domain administrators.

Commands such as `net group /domain` of the [Net](https://attack.mitre.org/software/S0039) utility, `dscacheutil -q group` on macOS, and `ldapsearch` on Linux can list domain-level groups.

#### Cloud Groups - T1069.003
[more on T1069.003](https://attack.mitre.org/techniques/T1069/003)

Adversaries may attempt to find cloud groups and permission settings. The knowledge of cloud permission groups can help adversaries determine the particular roles of users and groups within an environment, as well as which users are associated with a particular group.

With authenticated access there are several tools that can be used to find permissions groups. The `Get-MsolRole` PowerShell cmdlet can be used to obtain roles and permissions groups for Exchange and Office 365 accounts [1](https://docs.microsoft.com/en-us/powershell/module/msonline/get-msolrole?view=azureadps-1.0)[2](https://github.com/True-Demon/raindance).

Azure CLI (AZ CLI) and the Google Cloud Identity Provider API also provide interfaces to obtain permissions groups. The command `az ad user get-member-groups` will list groups associated to a user account for Azure while the API endpoint `GET https://cloudidentity.googleapis.com/v1/groups` lists group resources available to a user for Google [3](https://docs.microsoft.com/en-us/cli/azure/ad/user?view=azure-cli-latest)[4](https://www.blackhillsinfosec.com/red-teaming-microsoft-part-1-active-directory-leaks-via-azure/)[5](https://cloud.google.com/identity/docs/reference/rest).

Adversaries may attempt to list ACLs for objects to determine the owner and other accounts with access to the object, for example, via the AWS `GetBucketAcl` API [6](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketAcl.html). Using this information an adversary can target accounts with permissions to a given object or leverage accounts they have already compromised to access the object.


