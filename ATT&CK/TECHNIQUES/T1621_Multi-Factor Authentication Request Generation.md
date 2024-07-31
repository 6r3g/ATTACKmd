Tactics: [[CREDENTIAL_ACCESS]]
Tags: #mitre/attack/techniques/T1621 

# Multi-Factor Authentication Request Generation - T1621
---
## Description
[more on T1621](https://attack.mitre.org/techniques/T1621)

Adversaries may attempt to bypass multi-factor authentication (MFA) mechanisms and gain access to accounts by generating MFA requests sent to users.

Adversaries in possession of credentials to [[T1078_Valid Accounts|Valid Accounts]] may be unable to complete the login process if they lack access to the 2FA or MFA mechanisms required as an additional credential and security control. To circumvent this, adversaries may abuse the automatic generation of push notifications to MFA services such as Duo Push, Microsoft Authenticator, Okta, or similar services to have the user grant access to their account. If adversaries lack credentials to victim accounts, they may also abuse automatic push notification generation when this option is configured for self-service password reset (SSPR). [1](https://www.obsidiansecurity.com/blog/behind-the-breach-self-service-password-reset-azure-ad/)

In some cases, adversaries may continuously repeat login attempts in order to bombard users with MFA push notifications, SMS messages, and phone calls, potentially resulting in the user finally accepting the authentication request in response to "MFA fatigue." [2](https://therecord.media/russian-hackers-bypass-2fa-by-annoying-victims-with-repeated-push-notifications/) [3](https://portswigger.net/daily-swig/mfa-fatigue-attacks-users-tricked-into-allowing-device-access-due-to-overload-of-push-notifications) [4](https://www.mandiant.com/resources/russian-targeting-gov-business)
