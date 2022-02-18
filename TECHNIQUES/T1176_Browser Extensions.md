Tactics: [[PERSISTENCE]]
Tags: #mitre/attack/techniques/T1176  

# Browser Extensions - T1176
---
## Description
[more on T1176](https://attack.mitre.org/techniques/T1176)

Adversaries may abuse Internet browser extensions to establish persistent access to victim systems. Browser extensions or plugins are small programs that can add functionality and customize aspects of Internet browsers. They can be installed directly or through a browser's app store and generally have access and permissions to everything that the browser can access.[1](https://en.wikipedia.org/wiki/Browser_extension)[2](https://developer.chrome.com/extensions)

Malicious extensions can be installed into a browser through malicious app store downloads masquerading as legitimate extensions, through social engineering, or by an adversary that has already compromised a system. Security can be limited on browser app stores so it may not be difficult for malicious extensions to defeat automated scanners.[3](https://static.googleusercontent.com/media/research.google.com/en//pubs/archive/43824.pdf) Depending on the browser, adversaries may also manipulate an extension's update url to install updates from an adversary controlled server or manipulate the mobile configuration file to silently install additional extensions.

Previous to macOS 11, adversaries could silently install browser extensions via the command line using the `profiles` tool to install malicious `.mobileconfig` files. In macOS 11+, the use of the `profiles` tool can no longer install configuration profiles, however `.mobileconfig` files can be planted and installed with user interaction.[4](https://www.xorrior.com/No-Place-Like-Chrome/)

Once the extension is installed, it can browse to websites in the background,[5](https://www.ghacks.net/2017/09/19/first-chrome-extension-with-javascript-crypto-miner-detected/)[6](https://www.icebrg.io/blog/malicious-chrome-extensions-enable-criminals-to-impact-over-half-a-million-users-and-global-businesses) steal all information that a user enters into a browser (including credentials)[7](https://isc.sans.edu/forums/diary/BankerGoogleChromeExtensiontargetingBrazil/22722/)[8](https://isc.sans.edu/forums/diary/CatchAll+Google+Chrome+Malicious+Extension+Steals+All+Posted+Data/22976/https:/threatpost.com/malicious-chrome-extension-steals-data-posted-to-any-website/128680/)) and be used as an installer for a RAT for [[persistence]].

There have also been instances of botnets using a persistent backdoor through malicious Chrome extensions.[9](https://www.welivesecurity.com/2017/07/20/stantinko-massive-adware-campaign-operating-covertly-since-2012/) There have also been similar examples of extensions being used for command & control.[10](https://kjaer.io/extension-malware/)

---
## Sub-Techniques

#### none