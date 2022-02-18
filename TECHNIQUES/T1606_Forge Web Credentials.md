Tactics: [[CREDENTIAL_ACCESS]]
Tags: #mitre/attack/techniques/T1606  

# Forge Web Credentials - T1606
---
## Description
[more on T1606](https://attack.mitre.org/techniques/T1606)

Adversaries may forge credential materials that can be used to gain access to web applications or Internet services. Web applications and services (hosted in cloud SaaS environments or on-premise servers) often use session cookies, tokens, or other materials to authenticate and authorize user access.

Adversaries may generate these credential materials in order to gain access to web resources. This differs from [[T1539_Steal Web Session Cookie|Steal Web Session Cookie (T1539)]], [[T1528_Steal Application Access Token|Steal Application Access Token (T1528)]], and other similar behaviors in that the credentials are new and forged by the adversary, rather than stolen or intercepted from legitimate users. The generation of web credentials often requires secret values, such as passwords, [[T1552_Unsecured Credentials#Private Keys - T1552 004|Private Keys (T1552.004)]], or other cryptographic seed values.[1](https://github.com/damianh/aws-adfs-credential-generator)

Once forged, adversaries may use these web credentials to access resources (ex: [[T1550_Use Alternate Authentication Material|Use Alternate Authentication Material (T1550)]]), which may bypass multi-factor and other authentication protection mechanisms.[2](https://wunderwuzzi23.github.io/blog/passthecookie.html)[3](https://unit42.paloaltonetworks.com/mac-malware-steals-cryptocurrency-exchanges-cookies/)[4](https://msrc-blog.microsoft.com/2020/12/13/customer-guidance-on-recent-nation-state-cyber-attacks/)

---
## Sub-Techniques

#### Web Cookies - T1606.001
[more on T1606.001](https://attack.mitre.org/techniques/T1606/001)

Adversaries may forge web cookies that can be used to gain access to web applications or Internet services. Web applications and services (hosted in cloud SaaS environments or on-premise servers) often use session cookies to authenticate and authorize user access.

Adversaries may generate these cookies in order to gain access to web resources. This differs from [[T1539_Steal Web Session Cookie|Steal Web Session Cookie (T1539)]] and other similar behaviors in that the cookies are new and forged by the adversary, rather than stolen or intercepted from legitimate users. Most common web applications have standardized and documented cookie values that can be generated using provided tools or interfaces.[1](https://wunderwuzzi23.github.io/blog/passthecookie.html) The generation of web cookies often requires secret values, such as passwords, [[T1552_Unsecured Credentials#Private Keys - T1552 004|Private Keys (T1552.004)]], or other cryptographic seed values.

Once forged, adversaries may use these web cookies to access resources ([[T1550_Use Alternate Authentication Material#Web Session Cookie - T1550 004|Web Session Cookie (T1550.004)]]), which may bypass multi-factor and other authentication protection mechanisms.[2](https://www.volexity.com/blog/2020/12/14/dark-halo-leverages-solarwinds-compromise-to-breach-organizations/)[1](https://wunderwuzzi23.github.io/blog/passthecookie.html)[3](https://unit42.paloaltonetworks.com/mac-malware-steals-cryptocurrency-exchanges-cookies/)

#### SAML Tokens - T1606.002
[more on T1606.002](https://attack.mitre.org/techniques/T1606/002)

An adversary may forge SAML tokens with any permissions claims and lifetimes if they possess a valid SAML token-signing certificate.[1](https://blogs.microsoft.com/on-the-issues/2020/12/13/customers-protect-nation-state-cyberattacks/) The default lifetime of a SAML token is one hour, but the validity period can be specified in the `NotOnOrAfter` value of the `conditions ...` element in a token. This value can be changed using the `AccessTokenLifetime` in a `LifetimeTokenPolicy`.[2](https://docs.microsoft.com/en-us/azure/active-directory/develop/active-directory-configurable-token-lifetimes) Forged SAML tokens enable adversaries to authenticate across services that use SAML 2.0 as an SSO (single sign-on) mechanism.[3](https://www.cyberark.com/resources/threat-research-blog/golden-saml-newly-discovered-attack-technique-forges-authentication-to-cloud-apps)

An adversary may utilize [[T1552_Unsecured Credentials#Private Keys - T1552 004|Private Keys (T1552.004)]] to compromise an organization's token-signing certificate to create forged SAML tokens. If the adversary has sufficient permissions to establish a new federation trust with their own Active Directory Federation Services (AD FS) server, they may instead generate their own trusted token-signing certificate.[4](https://msrc-blog.microsoft.com/2020/12/13/customer-guidance-on-recent-nation-state-cyber-attacks/) This differs from [[T1528_Steal Application Access Token|Steal Application Access Token (T1528)]] and other similar behaviors in that the tokens are new and forged by the adversary, rather than stolen or intercepted from legitimate users.

An adversary may gain administrative Azure AD privileges if a SAML token is forged which claims to represent a highly privileged account. This may lead to [[T1550_Use Alternate Authentication Material|Use Alternate Authentication Material (T1550)]], which may bypass multi-factor and other authentication protection mechanisms.[4](https://msrc-blog.microsoft.com/2020/12/13/customer-guidance-on-recent-nation-state-cyber-attacks/)



