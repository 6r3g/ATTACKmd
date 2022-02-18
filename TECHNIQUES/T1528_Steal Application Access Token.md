Tactics: [[CREDENTIAL_ACCESS]]
Tags: #mitre/attack/techniques/T1528  

# Steal Application Access Token - T1528
---
## Description
[more on T1528](https://attack.mitre.org/techniques/T1528)

Adversaries can steal user application access tokens as a means of acquiring credentials to access remote systems and resources. This can occur through social engineering and typically requires user action to grant access.

Application access tokens are used to make authorized API requests on behalf of a user and are commonly used as a way to access resources in cloud-based applications and software-as-a-service (SaaS).[1](https://auth0.com/blog/why-should-use-accesstokens-to-secure-an-api/) OAuth is one commonly implemented framework that issues tokens to users for access to systems. An application desiring access to cloud-based services or protected APIs can gain entry using OAuth 2.0 through a variety of authorization protocols. An example commonly-used sequence is Microsoft's Authorization Code Grant flow.[2](https://docs.microsoft.com/en-us/azure/active-directory/develop/active-directory-v2-protocols)[3](https://docs.microsoft.com/en-us/azure/active-directory/develop/v2-oauth2-auth-code-flow) An OAuth access token enables a third-party application to interact with resources containing user data in the ways requested by the application without obtaining user credentials.

Adversaries can leverage OAuth authorization by constructing a malicious application designed to be granted access to resources with the target user's OAuth token. The adversary will need to complete registration of their application with the authorization server, for example Microsoft Identity Platform using Azure Portal, the Visual Studio IDE, the command-line interface, PowerShell, or REST API calls.[4](https://docs.microsoft.com/en-us/azure/active-directory/develop/quickstart-register-app) Then, they can send a link through [[T1566_Phishing#Spearphishing Link - T1566 002|Spearphishing Link (T1566.002)]] to the target user to entice them to grant access to the application. Once the OAuth access token is granted, the application can gain potentially long-term access to features of the user account through [[T1550_Use Alternate Authentication Material#Application Access Token - T1550 001|Application Access Token (T1550.001)]].[5](https://docs.microsoft.com/en-us/azure/active-directory/develop/access-tokens)

Adversaries have been seen targeting Gmail, Microsoft Outlook, and Yahoo Mail users.[6](https://www.amnesty.org/en/latest/research/2019/08/evolving-phishing-attacks-targeting-journalists-and-human-rights-defenders-from-the-middle-east-and-north-africa/)[7](https://blog.trendmicro.com/trendlabs-security-intelligence/pawn-storm-abuses-open-authentication-advanced-social-engineering-attacks)

---
## Sub-Techniques

#### none
