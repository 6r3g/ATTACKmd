Tactics: [[DEFENSE_EVASION]]
Tags: #mitre/attack/techniques/T1036  

# Masquerading - T1036
---
## Description
[more on T1036](https://attack.mitre.org/techniques/T1036)

Adversaries may attempt to manipulate features of their artifacts to make them appear legitimate or benign to users and/or security tools. Masquerading occurs when the name or location of an object, legitimate or malicious, is manipulated or abused for the sake of evading defenses and observation. This may include manipulating file metadata, tricking users into misidentifying the file type, and giving legitimate task or service names.

Renaming abusable system utilities to evade security monitoring is also a form of [[T1036_Masquerading|Masquerading (T1036)]].[1](https://lolbas-project.github.io/)

---
## Sub-Techniques

#### Invalid Code Signature - T1036.001
[more on T1036.001](https://attack.mitre.org/techniques/T1036/001)

Adversaries may attempt to mimic features of valid code signatures to increase the chance of deceiving a user, analyst, or tool. Code signing provides a level of authenticity on a binary from the developer and a guarantee that the binary has not been tampered with. Adversaries can copy the metadata and signature information from a signed program, then use it as a template for an unsigned program. Files with invalid code signatures will fail digital signature validation checks, but they may appear more legitimate to users and security tools may improperly handle these files.[1](https://threatexpress.com/blogs/2017/metatwin-borrowing-microsoft-metadata-and-digital-signatures-to-hide-binaries/)

Unlike [[T1553_Subvert Trust Controls#Code Signing - T1553 002|Code Signing (T1553.002)]], this activity will not result in a valid signature.

#### Right-to-Left Override - T1036.002
[more on T1036.002](https://attack.mitre.org/techniques/T1036/002)

Adversaries may abuse the right-to-left override (RTLO or RLO) character (U+202E) to disguise a string and/or file name to make it appear benign. RTLO is a non-printing Unicode character that causes the text that follows it to be displayed in reverse. For example, a Windows screensaver executable named `March 25 \u202Excod.scr` will display as `March 25 rcs.docx`. A JavaScript file named `photo_high_re\u202Egnp.js` will be displayed as `photo_high_resj.png`.[1](https://resources.infosecinstitute.com/spoof-using-right-to-left-override-rtlo-technique-2/)

Adversaries may abuse the RTLO character as a means of tricking a user into executing what they think is a benign file type. A common use of this technique is with [[T1566_Phishing#Spearphishing Attachment - T1566 001|Spearphishing Attachment (T1566.001)]]/[[T1204_User Execution#Malicious File - T1204 002|Malicious File (T1204.002)]] since it can trick both end users and defenders if they are not aware of how their tools display and render the RTLO character. Use of the RTLO character has been seen in many targeted intrusion attempts and criminal activity.[2](https://blog.trendmicro.com/trendlabs-security-intelligence/plead-targeted-attacks-against-taiwanese-government-agencies-2/)[3](https://securelist.com/zero-day-vulnerability-in-telegram/83800/) RTLO can be used in the Windows Registry as well, where regedit.exe displays the reversed characters but the command line tool reg.exe does not by default.

#### Rename System Utilities - T1036.003
[more on T1036.003](https://attack.mitre.org/techniques/T1036/003)

Adversaries may rename legitimate system utilities to try to evade security mechanisms concerning the usage of those utilities. Security monitoring and control mechanisms may be in place for system utilities adversaries are capable of abusing. [1](https://lolbas-project.github.io/) It may be possible to bypass those security mechanisms by renaming the utility prior to utilization (ex: rename `rundll32.exe`). [2](http://pages.endgame.com/rs/627-YBU-612/images/EndgameJournal_The%20Masquerade%20Ball_Pages_R2.pdf) An alternative case occurs when a legitimate utility is copied or moved to a different directory and renamed to avoid detections based on system utilities executing from non-standard paths. [3](https://blog-assets.f-secure.com/wp-content/uploads/2019/10/15163418/CozyDuke.pdf)

#### Masquerade Task or Service - T1036.004
[more on T1036.004](https://attack.mitre.org/techniques/T1036/004)

Adversaries may attempt to manipulate the name of a task or service to make it appear legitimate or benign. Tasks/services executed by the Task Scheduler or systemd will typically be given a name and/or description.[1](https://technet.microsoft.com/en-us/library/bb490996.aspx)[2](https://www.freedesktop.org/software/systemd/man/systemd.service.html) Windows services will have a service name as well as a display name. Many benign tasks and services exist that have commonly associated names. Adversaries may give tasks or services names that are similar or identical to those of legitimate ones.

Tasks or services contain other fields, such as a description, that adversaries may attempt to make appear legitimate.[3](http://researchcenter.paloaltonetworks.com/2016/11/unit42-shamoon-2-return-disttrack-wiper/)[4](https://vms.drweb.com/virus/?i=4276269)

#### Match Legitimate Name or Location - T1036.005
[more on T1036.005](https://attack.mitre.org/techniques/T1036/005)

Adversaries may match or approximate the name or location of legitimate files or resources when naming/placing them. This is done for the sake of evading defenses and observation. This may be done by placing an executable in a commonly trusted directory (ex: under System32) or giving it the name of a legitimate, trusted program (ex: svchost.exe). In containerized environments, this may also be done by creating a resource in a namespace that matches the naming convention of a container pod or cluster. Alternatively, a file or container image name given may be a close approximation to legitimate programs/images or something innocuous.

Adversaries may also use the same icon of the file they are trying to mimic.

#### Space after Filename - T1036.006
[more on T1036.006](https://attack.mitre.org/techniques/T1036/006)

Adversaries can hide a program's true filetype by changing the extension of a file. With certain file types (specifically this does not work with .app extensions), appending a space to the end of a filename will change how the file is processed by the operating system.

For example, if there is a Mach-O executable file called `evil.bin`, when it is double clicked by a user, it will launch Terminal.app and execute. If this file is renamed to `evil.txt`, then when double clicked by a user, it will launch with the default text editing application (not executing the binary). However, if the file is renamed to `evil.txt` (note the space at the end), then when double clicked by a user, the true file type is determined by the OS and handled appropriately and the binary will be executed [1](https://arstechnica.com/security/2016/07/after-hiatus-in-the-wild-mac-backdoors-are-suddenly-back/).

Adversaries can use this feature to trick users into double clicking benign-looking files of any format and ultimately executing something malicious.

#### Double File Extension - T1036.007
[more on T1036.007](https://attack.mitre.org/techniques/T1036/007)

Adversaries may abuse a double extension in the filename as a means of masquerading the true file type. A file name may include a secondary file type extension that may cause only the first extension to be displayed (ex: `File.txt.exe` may render in some views as just `File.txt`). However, the second extension is the true file type that determines how the file is opened and executed. The real file extension may be hidden by the operating system in the file browser (ex: explorer.exe), as well as in any software configured using or similar to the system’s policies.[1](https://www.pcmag.com/encyclopedia/term/double-extension)[2](https://socprime.com/blog/rule-of-the-week-possible-malicious-file-double-extension/)

Adversaries may abuse double extensions to attempt to conceal dangerous file types of payloads. A very common usage involves tricking a user into opening what they think is a benign file type but is actually executable code. Such files often pose as email attachments and allow an adversary to gain [Initial Access](https://attack.mitre.org/tactics/TA0001) into a user’s system via [[T1566_Phishing#Spearphishing Attachment - T1566 001|Spearphishing Attachment (T1566.001)]] then [[T1204_User Execution|User Execution (T1204)]]. For example, an executable file attachment named `Evil.txt.exe` may display as `Evil.txt` to a user. The user may then view it as a benign text file and open it, inadvertently executing the hidden malware.[2](https://socprime.com/blog/rule-of-the-week-possible-malicious-file-double-extension/)

Common file types, such as text files (.txt, .doc, etc.) and image files (.jpg, .gif, etc.) are typically used as the first extension to appear benign. Executable extensions commonly regarded as dangerous, such as .exe, .lnk, .hta, and .scr, often appear as the second extension and true file type.



