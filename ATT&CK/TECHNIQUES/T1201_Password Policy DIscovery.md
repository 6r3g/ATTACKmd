Tactics: [[DISCOVERY]]
Tags: #mitre/attack/techniques/T1201  

# Password Policy Discovery - T1201
---
## Description
[more on T1201](https://attack.mitre.org/techniques/T1201)

Adversaries may attempt to access detailed information about the password policy used within an enterprise network or cloud environment. Password policies are a way to enforce complex passwords that are difficult to guess or crack through [[T1110_Brute Force|Brute Force (T1110)]]. This information may help the adversary to create a list of common passwords and launch dictionary and/or brute force attacks which adheres to the policy (e.g. if the minimum password length should be 8, then not trying passwords such as 'pass123'; not checking for more than 3-4 passwords per account if the lockout is set to 6 as to not lock out accounts).

Password policies can be set and discovered on Windows, Linux, and macOS systems via various command shell utilities such as `net accounts (/domain)`, `Get-ADDefaultDomainPasswordPolicy`, `chage -l` , `cat /etc/pam.d/common-password`, and `pwpolicy getaccountpolicies` [1](https://superuser.com/questions/150675/how-to-display-password-policy-information-for-a-user-ubuntu) [2](https://www.jamf.com/jamf-nation/discussions/18574/user-password-policies-on-non-ad-machines).

Password policies can be discovered in cloud environments using available APIs such as `GetAccountPasswordPolicy` in AWS [3](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetAccountPasswordPolicy.html).

---
## Sub-Techniques

#### none

