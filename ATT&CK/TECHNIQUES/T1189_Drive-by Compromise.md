Tactics: [[INITIAL_ACCESS]]
Tags: #mitre/attack/techniques/T1189 

# Drive-by Compromise - T1189
---
## Description
[more on T1189](https://attack.mitre.org/techniques/T1189)

Adversaries may gain access to a system through a user visiting a website over the normal course of browsing. With this technique, the user's web browser is typically targeted for exploitation, but adversaries may also use compromised websites for non-exploitation behavior such as acquiring [[T1550_Use Alternate Authentication Material#Application Access Token - T1550 001|Application Access Token (T1550.001)]].

Multiple ways of delivering exploit code to a browser exist, including:

-   A legitimate website is compromised where adversaries have injected some form of malicious code such as JavaScript, iFrames, and cross-site scripting.
-   Malicious ads are paid for and served through legitimate ad providers.
-   Built-in web application interfaces are leveraged for the insertion of any other kind of object that can be used to display web content or contain a script that executes on the visiting client (e.g. forum posts, comments, and other user controllable web content).

Often the website used by an adversary is one visited by a specific community, such as government, a particular industry, or region, where the goal is to compromise a specific user or set of users based on a shared interest. This kind of targeted attack is referred to a strategic web compromise or watering hole attack. There are several known examples of this occurring.[1](http://blog.shadowserver.org/2012/05/15/cyber-espionage-strategic-web-compromises-trusted-websites-serving-dangerous-results/)

Typical drive-by compromise process:

1.  A user visits a website that is used to host the adversary controlled content.
2.  Scripts automatically execute, typically searching versions of the browser and plugins for a potentially vulnerable version.
    -   The user may be required to assist in this process by enabling scripting or active website components and ignoring warning dialog boxes.
3.  Upon finding a vulnerable version, exploit code is delivered to the browser.
4.  If exploitation is successful, then it will give the adversary code execution on the user's system unless other protections are in place.
    -   In some cases a second visit to the website after the initial scan is required before exploit code is delivered.

Unlike [[T1190_Exploit Public-Facing Application|Exploit Public-Facing Application (T1190)]], the focus of this technique is to exploit software on a client endpoint upon visiting a website. This will commonly give an adversary access to systems on the internal network instead of external systems that may be in a DMZ.

Adversaries may also use compromised websites to deliver a user to a malicious application designed to [[T1528_Steal Application Access Token|Steal Application Access Token (T1528)]]s, like OAuth tokens, to gain access to protected applications and information. These malicious applications have been delivered through popups on legitimate websites.[2](https://www.volexity.com/blog/2017/11/06/oceanlotus-blossoms-mass-digital-surveillance-and-exploitation-of-asean-nations-the-media-human-rights-and-civil-society/)

---
## Sub-Techniques

#### none