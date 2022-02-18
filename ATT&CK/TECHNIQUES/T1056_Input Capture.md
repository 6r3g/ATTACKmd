Tactics: [[CREDENTIAL_ACCESS]] - [[COLLECTION]]
Tags: #mitre/attack/techniques/T1056  

# Input Capture - T1056
---
## Description
[more on T1056](https://attack.mitre.org/techniques/T1056)

Adversaries may use methods of capturing user input to obtain credentials or collect information. During normal system usage, users often provide credentials to various different locations, such as login pages/portals or system dialog boxes. Input capture mechanisms may be transparent to the user (e.g. [[T1056_Input Capture#Credential API Hooking - T1056 004|Credential API Hooking (T1056.004)]]) or rely on deceiving the user into providing input into what they believe to be a genuine service (e.g. [[T1056_Input Capture#Web Portal Capture - T1056 003|Web Portal Capture (T1056.003)]]).

---
## Sub-Techniques

#### Keylogging - T1056.001
[more on T1056.001](https://attack.mitre.org/techniques/T1056/001)

Adversaries may log user keystrokes to intercept credentials as the user types them. Keylogging is likely to be used to acquire credentials for new access opportunities when [[T1003_OS Credential Dumping|OS Credential Dumping (T1003)]] efforts are not effective, and may require an adversary to intercept keystrokes on a system for a substantial period of time before credentials can be successfully captured.

Keylogging is the most prevalent type of input capture, with many different ways of intercepting keystrokes.[1](http://opensecuritytraining.info/Keylogging_files/The%20Adventures%20of%20a%20Keystroke.pdf) Some methods include:

-   Hooking API callbacks used for processing keystrokes. Unlike [[T1056_Input Capture#Credential API Hooking - T1056 004|Credential API Hooking (T1056.004)]], this focuses solely on API functions intended for processing keystroke data.
-   Reading raw keystroke data from the hardware buffer.
-   Windows Registry modifications.
-   Custom drivers.
-   [[T1601_Modify System Image|Modify System Image (T1601)]] may provide adversaries with hooks into the operating system of network devices to read raw keystrokes for login sessions.[2](https://community.cisco.com/t5/security-blogs/attackers-continue-to-target-legacy-devices/ba-p/4169954)

#### GUI Input Capture - T1056.002
[more on T1056.002](https://attack.mitre.org/techniques/T1056/002)

Adversaries may mimic common operating system GUI components to prompt users for credentials with a seemingly legitimate prompt. When programs are executed that need additional privileges than are present in the current user context, it is common for the operating system to prompt the user for proper credentials to authorize the elevated privileges for the task (ex: [[T1548_Abuse Elevation Control Mechanism#Bypass User Account Control - T1548 002|Bypass User Account Control (T1548.002)]]).

Adversaries may mimic this functionality to prompt users for credentials with a seemingly legitimate prompt for a number of reasons that mimic normal usage, such as a fake installer requiring additional access or a fake malware removal suite.[1](https://baesystemsai.blogspot.com/2015/06/new-mac-os-malware-exploits-mackeeper.html) This type of prompt can be used to collect credentials via various languages such as [[T1059_Command and Scripting Interpreter#AppleScript - T1059 002|AppleScript (T1059.002)]][2](https://logrhythm.com/blog/do-you-trust-your-computer/)[3](https://www.welivesecurity.com/2016/07/06/new-osxkeydnap-malware-hungry-credentials/)[4](https://embracethered.com/blog/posts/2021/spoofing-credential-dialogs/) and [[T1059_Command and Scripting Interpreter#PowerShell - T1059 001|PowerShell (T1059.001)]].[2](https://logrhythm.com/blog/do-you-trust-your-computer/)[5](https://enigma0x3.net/2015/01/21/phishing-for-credentials-if-you-want-it-just-ask/)[4](https://embracethered.com/blog/posts/2021/spoofing-credential-dialogs/) On Linux systems attackers may launch dialog boxes prompting users for credentials from malicious shell scripts or the command line (i.e. [[T1059_Command and Scripting Interpreter#Unix Shell - T1059 004|Unix Shell (T1059.004)]]).[4](https://embracethered.com/blog/posts/2021/spoofing-credential-dialogs/)

#### Web Portal Capture - T1056.003
[more on T1056.003](https://attack.mitre.org/techniques/T1056/003)

Adversaries may install code on externally facing portals, such as a VPN login page, to capture and transmit credentials of users who attempt to log into the service. For example, a compromised login page may log provided user credentials before logging the user in to the service.

This variation on input capture may be conducted post-compromise using legitimate administrative access as a backup measure to maintain network access through [[T1133_External Remote Services|External Remote Services (T1133)]] and [[T1078_Valid Accounts|Valid Accounts (T1078)]] or as part of the initial compromise by exploitation of the externally facing web service.[1](https://www.volexity.com/blog/2015/10/07/virtual-private-keylogging-cisco-web-vpns-leveraged-for-access-and-persistence/)

#### Credential API Hooking  - T1056.004
[more on T1056.004](https://attack.mitre.org/techniques/T1056/004)

Adversaries may hook into Windows application programming interface (API) functions to collect user credentials. Malicious hooking mechanisms may capture API calls that include parameters that reveal user authentication credentials. Unlike [[T1056_Input Capture#Keylogging - T1056 001|Keylogging (T1056.001)]], this technique focuses specifically on API functions that include parameters that reveal user credentials. Hooking involves redirecting calls to these functions and can be implemented via:

-   **Hooks procedures**, which intercept and execute designated code in response to events such as messages, keystrokes, and mouse inputs.[2](https://msdn.microsoft.com/library/windows/desktop/ms644959.aspx)[3](https://www.endgame.com/blog/technical-blog/ten-process-injection-techniques-technical-survey-common-and-trending-process)
-   **Import address table (IAT) hooking**, which use modifications to a process’s IAT, where pointers to imported API functions are stored.[3](https://www.endgame.com/blog/technical-blog/ten-process-injection-techniques-technical-survey-common-and-trending-process)[4](https://www.adlice.com/userland-rootkits-part-1-iat-hooks/)[5](https://www.mwrinfosecurity.com/our-thinking/dynamic-hooking-techniques-user-mode/)
-   **Inline hooking**, which overwrites the first bytes in an API function to redirect code flow.[3](https://www.endgame.com/blog/technical-blog/ten-process-injection-techniques-technical-survey-common-and-trending-process)[6](https://www.exploit-db.com/docs/17802.pdf)[5](https://www.mwrinfosecurity.com/our-thinking/dynamic-hooking-techniques-user-mode/)