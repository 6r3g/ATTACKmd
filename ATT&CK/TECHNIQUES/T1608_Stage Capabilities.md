Tactics: [[RESOURCES_DEVELOPMENT]]
Tags: #mitre/attack/techniques/T1608 

# Stage Capabilities - T1608
---
## Description
[more on T1608](https://attack.mitre.org/techniques/T1608)

Adversaries may upload, install, or otherwise set up capabilities that can be used during targeting. To support their operations, an adversary may need to take capabilities they developed ([[T1587_Develop Capabilities|Develop Capabilities (T1587)]]) or obtained ([[T1588_Obtain Capabilities|Obtain Capabilities (T1588)]]) and stage them on infrastructure under their control. These capabilities may be staged on infrastructure that was previously purchased/rented by the adversary ([[T1583_Acquire Infrastructure|Acquire Infrastructure (T1583)]]) or was otherwise compromised by them ([[T1584_Compromise Infrastructure|Compromise Infrastructure (T1584)]]). Capabilities can also be staged on web services, such as GitHub or Pastebin.[1](https://www.volexity.com/blog/2020/11/06/oceanlotus-extending-cyber-espionage-operations-through-fake-websites/)

Staging of capabilities can aid the adversary in a number of initial access and post-compromise behaviors, including (but not limited to):

-   Staging web resources necessary to conduct [[T1189_Drive-by Compromise|Drive-by Compromise (T1189)]] when a user browses to a site.[2](https://www.fireeye.com/blog/threat-research/2012/12/council-foreign-relations-water-hole-attack-details.html)[3](http://arstechnica.com/security/2015/08/newly-discovered-chinese-hacking-group-hacked-100-websites-to-use-as-watering-holes/)[4](https://cybersecurity.att.com/blogs/labs-research/scanbox-a-reconnaissance-framework-used-on-watering-hole-attacks)
-   Staging web resources for a link target to be used with spearphishing.[5](https://blog.malwarebytes.com/malwarebytes-news/2020/10/silent-librarian-apt-phishing-attack/)[6](https://www.proofpoint.com/us/threat-insight/post/threat-actor-profile-ta407-silent-librarian)
-   Uploading malware or tools to a location accessible to a victim network to enable [[T1105_Ingress Tool Transfer|Ingress Tool Transfer (T1105)]].[1](https://www.volexity.com/blog/2020/11/06/oceanlotus-extending-cyber-espionage-operations-through-fake-websites/)
-   Installing a previously acquired SSL/TLS certificate to use to encrypt command and control traffic (ex: [[T1573_Encrypted Channel#Asymmetric Cryptography - T1573 002|Asymmetric Cryptography (T1573.002)]] with [[T1071_Application Layer Protocol#Web Protocols - T1071 001|Web Protocols (T1071.001)]]).[7](https://www.digicert.com/kb/ssl-certificate-installation.htm)

---
## Sub-Techniques

#### Upload Malware - T1608.001
[more on T1608.001](https://attack.mitre.org/techniques/T1608/001)

Adversaries may upload malware to third-party or adversary controlled infrastructure to make it accessible during targeting. Malicious software can include payloads, droppers, post-compromise tools, backdoors, and a variety of other malicious content. Adversaries may upload malware to support their operations, such as making a payload available to a victim network to enable [[T1105_Ingress Tool Transfer|Ingress Tool Transfer (T1105)]] by placing it on an Internet accessible web server.

Malware may be placed on infrastructure that was previously purchased/rented by the adversary ([[T1583_Acquire Infrastructure|Acquire Infrastructure (T1583)]]) or was otherwise compromised by them ([[T1584_Compromise Infrastructure|Compromise Infrastructure (T1584)]]). Malware can also be staged on web services, such as GitHub or Pastebin.[1](https://www.volexity.com/blog/2020/11/06/oceanlotus-extending-cyber-espionage-operations-through-fake-websites/)

Adversaries may upload backdoored files, such as application binaries, virtual machine images, or container images, to third-party software stores or repositories (ex: GitHub, CNET, AWS Community AMIs, Docker Hub). By chance encounter, victims may directly download/install these backdoored files via [[T1204_User Execution|User Execution (T1204)]]. [[T1036_Masquerading|Masquerading (T1036)]] may increase the chance of users mistakenly executing these files.

#### Upload Tool - T1608.002
[more on T1608.002](https://attack.mitre.org/techniques/T1608/002)

Adversaries may upload tools to third-party or adversary controlled infrastructure to make it accessible during targeting. Tools can be open or closed source, free or commercial. Tools can be used for malicious purposes by an adversary, but (unlike malware) were not intended to be used for those purposes (ex: [PsExec](https://attack.mitre.org/software/S0029)). Adversaries may upload tools to support their operations, such as making a tool available to a victim network to enable [[T1105_Ingress Tool Transfer|Ingress Tool Transfer (T1105)]] by placing it on an Internet accessible web server.

Tools may be placed on infrastructure that was previously purchased/rented by the adversary ([[T1583_Acquire Infrastructure|Acquire Infrastructure (T1583)]]) or was otherwise compromised by them ([[T1584_Compromise Infrastructure|Compromise Infrastructure (T1584)]]).[1](https://www.secureworks.com/research/threat-group-3390-targets-organizations-for-cyberespionage) Tools can also be staged on web services, such as an adversary controlled GitHub repo.

Adversaries can avoid the need to upload a tool by having compromised victim machines download the tool directly from a third-party hosting location (ex: a non-adversary controlled GitHub repo), including the original hosting site of the tool.

#### Install Digital Certificates - T1608.003
[more on T1608.003](https://attack.mitre.org/techniques/T1608/003)

Adversaries may install SSL/TLS certificates that can be used during targeting. SSL/TLS certificates are files that can be installed on servers to enable secure communications between systems. Digital certificates include information about the key, information about its owner's identity, and the digital signature of an entity that has verified the certificate's contents are correct. If the signature is valid, and the person examining the certificate trusts the signer, then they know they can use that key to communicate securely with its owner. Certificates can be uploaded to a server, then the server can be configured to use the certificate to enable encrypted communication with it.[1](https://www.digicert.com/kb/ssl-certificate-installation.htm)

Adversaries may install SSL/TLS certificates that can be used to further their operations, such as encrypting C2 traffic (ex: [[T1573_Encrypted Channel#Asymmetric Cryptography - T1573 002|Asymmetric Cryptography (T1573.002)]] with [[T1071_Application Layer Protocol#Web Protocols - T1071 001|Web Protocols (T1071.001)]]) or lending credibility to a credential harvesting site. Installation of digital certificates may take place for a number of server types, including web servers and email servers.

Adversaries can obtain digital certificates (see [[T1588_Obtain Capabilities#Digital Certificates - T1588 004|Digital Certificates (T1588.004)]]) or create self-signed certificates (see [[T1587_Develop Capabilities#Digital Certificates - T1587 003|Digital Certificates (T1587.003)]]). Digital certificates can then be installed on adversary controlled infrastructure that may have been acquired ([[T1583_Acquire Infrastructure|Acquire Infrastructure (T1583)]]) or previously compromised ([[T1584_Compromise Infrastructure|Compromise Infrastructure (T1584)]]).

#### Drive-by Target - T1608.004
[more on T1608.004](https://attack.mitre.org/techniques/T1608/004)

Adversaries may prepare an operational environment to infect systems that visit a website over the normal course of browsing. Endpoint systems may be compromised through browsing to adversary controlled sites, as in [[T1189_Drive-by Compromise|Drive-by Compromise (T1189)]]. In such cases, the user's web browser is typically targeted for exploitation (often not requiring any extra user interaction once landing on the site), but adversaries may also set up websites for non-exploitation behavior such as [[T1550_Use Alternate Authentication Material#Application Access Token - T1550 001|Application Access Token (T1550.001)]]. Prior to [[T1189_Drive-by Compromise|Drive-by Compromise (T1189)]], adversaries must stage resources needed to deliver that exploit to users who browse to an adversary controlled site. Drive-by content can be staged on adversary controlled infrastructure that has been acquired ([[T1583_Acquire Infrastructure|Acquire Infrastructure (T1583)]]) or previously compromised ([[T1584_Compromise Infrastructure|Compromise Infrastructure (T1584)]]).

Adversaries may upload or inject malicious web content, such as [[T1059_Command and Scripting Interpreter#JavaScript - T1059 007|JavaScript (T1059.007)]], into websites.[1](https://www.fireeye.com/blog/threat-research/2012/12/council-foreign-relations-water-hole-attack-details.html)[2](http://arstechnica.com/security/2015/08/newly-discovered-chinese-hacking-group-hacked-100-websites-to-use-as-watering-holes/) This may be done in a number of ways, including inserting malicious script into web pages or other user controllable web content such as forum posts. Adversaries may also craft malicious web advertisements and purchase ad space on a website through legitimate ad providers. In addition to staging content to exploit a user's web browser, adversaries may also stage scripting content to profile the user's browser (as in [[T1592_Gather Victim Host Information|Gather Victim Host Information (T1592)]]) to ensure it is vulnerable prior to attempting exploitation.[3](https://cybersecurity.att.com/blogs/labs-research/scanbox-a-reconnaissance-framework-used-on-watering-hole-attacks)

Websites compromised by an adversary and used to stage a drive-by may be ones visited by a specific community, such as government, a particular industry, or region, where the goal is to compromise a specific user or set of users based on a shared interest. This kind of targeted attack is referred to a strategic web compromise or watering hole attack.

Adversaries may purchase domains similar to legitimate domains (ex: homoglyphs, typosquatting, different top-level domain, etc.) during acquisition of infrastructure ([[T1583_Acquire Infrastructure#Domains - T1583 001|Domains (T1583.001)]]) to help facilitate [[T1189_Drive-by Compromise|Drive-by Compromise (T1189)]].

#### Link Target - T1608.005
[more on T1608.005](https://attack.mitre.org/techniques/T1608/005)

Adversaries may put in place resources that are referenced by a link that can be used during targeting. An adversary may rely upon a user clicking a malicious link in order to divulge information (including credentials) or to gain execution, as in [[T1204_User Execution#Malicious Link - T1204 001|Malicious Link (T1204.001)]]. Links can be used for spearphishing, such as sending an email accompanied by social engineering text to coax the user to actively click or copy and paste a URL into a browser. Prior to a phish for information (as in [[T1598_Phishing for Information#Spearphishing Link - T1598 003|Spearphishing Link (T1598.003)]]) or a phish to gain initial access to a system (as in [[T1566_Phishing#Spearphishing Link - T1566 002|Spearphishing Link (T1566.002)]]), an adversary must set up the resources for a link target for the spearphishing link.

Typically, the resources for a link target will be an HTML page that may include some client-side script such as [[T1059_Command and Scripting Interpreter#JavaScript - T1059 007|JavaScript (T1059.007)]] to decide what content to serve to the user. Adversaries may clone legitimate sites to serve as the link target, this can include cloning of login pages of legitimate web services or organization login pages in an effort to harvest credentials during [[T1598_Phishing for Information#Spearphishing Link - T1598 003|Spearphishing Link (T1598.003)]].[1](https://blog.malwarebytes.com/malwarebytes-news/2020/10/silent-librarian-apt-phishing-attack/)[2](https://www.proofpoint.com/us/threat-insight/post/threat-actor-profile-ta407-silent-librarian) Adversaries may also [[T1608_Stage Capabilities#Upload Malware - T1608 001|Upload Malware (T1608.001)]] and have the link target point to malware for download/execution by the user.

Adversaries may purchase domains similar to legitimate domains (ex: homoglyphs, typosquatting, different top-level domain, etc.) during acquisition of infrastructure ([[T1583_Acquire Infrastructure#Domains - T1583 001|Domains (T1583.001)]]) to help facilitate [[T1204_User Execution#Malicious Link - T1204 001|Malicious Link (T1204.001)]]. Link shortening services can also be employed.

#### SEO Poisoning - T1608.006
[more on T1608.006](https://attack.mitre.org/techniques/T1608/006)

Adversaries may poison mechanisms that influence search engine optimization (SEO) to further lure staged capabilities towards potential victims. Search engines typically display results to users based on purchased ads as well as the site’s ranking/score/reputation calculated by their web crawlers and algorithms. [1](https://atlas-cybersecurity.com/cyber-threats/threat-actors-use-search-engine-optimization-tactics-to-redirect-traffic-and-install-malware/) [2](https://www.malwarebytes.com/blog/news/2018/05/seo-poisoning-is-it-worth-it)

To help facilitate [[T1189_Drive-by Compromise|Drive-by Compromise]], adversaries may stage content that explicitly manipulates SEO rankings in order to promote sites hosting their malicious payloads (such as [[T1608_Stage Capabilities#Drive-by Target - T1608.004|Drive-by Target]]) within search engines. Poisoning SEO rankings may involve various tricks, such as stuffing keywords (including in the form of hidden text) into compromised sites. These keywords could be related to the interests/browsing habits of the intended victim(s) as well as more broad, seasonably popular topics (e.g. elections, trending news). [3](https://www.zscaler.com/blogs/security-research/ubiquitous-seo-poisoning-urls-0) [1](https://atlas-cybersecurity.com/cyber-threats/threat-actors-use-search-engine-optimization-tactics-to-redirect-traffic-and-install-malware/)

Adversaries may also purchase or plant incoming links to staged capabilities in order to boost the site’s calculated relevance and reputation. [2](https://www.malwarebytes.com/blog/news/2018/05/seo-poisoning-is-it-worth-it) [4](https://thedfirreport.com/2022/05/09/seo-poisoning-a-gootloader-story/)

SEO poisoning may also be combined with evasive redirects and other cloaking mechanisms (such as measuring mouse movements or serving content based on browser user agents, user language/localization settings, or HTTP headers) in order to feed SEO inputs while avoiding scrutiny from defenders. [3](https://www.zscaler.com/blogs/security-research/ubiquitous-seo-poisoning-urls-0) [5](https://news.sophos.com/en-us/2021/03/01/gootloader-expands-its-payload-delivery-options/)

