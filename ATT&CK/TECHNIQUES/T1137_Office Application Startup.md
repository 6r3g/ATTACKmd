Tactics: [[PERSISTENCE]]
Tags: #mitre/attack/techniques/T1137  

# Office Application Startup - T1137
---
## Description
[more on T1137](https://attack.mitre.org/techniques/T1137)

Adversaries may leverage Microsoft Office-based applications for persistence between startups. Microsoft Office is a fairly common application suite on Windows-based operating systems within an enterprise network. There are multiple mechanisms that can be used with Office for persistence when an Office-based application is started; this can include the use of Office Template Macros and add-ins.

A variety of features have been discovered in Outlook that can be abused to obtain persistence, such as Outlook rules, forms, and Home Page.[1](https://github.com/sensepost/ruler) These persistence mechanisms can work within Outlook or be used through Office 365.[2](https://blogs.technet.microsoft.com/office365security/defending-against-rules-and-forms-injection/)

---
## Sub-Techniques

#### Office Template Macros - T1137.001
[more on T1137.001](https://attack.mitre.org/techniques/T1137/001)

Adversaries may abuse Microsoft Office templates to obtain persistence on a compromised system. Microsoft Office contains templates that are part of common Office applications and are used to customize styles. The base templates within the application are used each time an application starts. [1](https://support.office.com/article/Change-the-Normal-template-Normal-dotm-06de294b-d216-47f6-ab77-ccb5166f98ea)

Office Visual Basic for Applications (VBA) macros [2](https://msdn.microsoft.com/en-us/vba/office-shared-vba/articles/getting-started-with-vba-in-office) can be inserted into the base template and used to execute code when the respective Office application starts in order to obtain persistence. Examples for both Word and Excel have been discovered and published. By default, Word has a Normal.dotm template created that can be modified to include a malicious macro. Excel does not have a template file created by default, but one can be added that will automatically be loaded.[3](https://enigma0x3.net/2014/01/23/maintaining-access-with-normal-dotm/comment-page-1/)[4](http://www.hexacorn.com/blog/2017/04/19/beyond-good-ol-run-key-part-62/) Shared templates may also be stored and pulled from remote locations.[5](https://www.221bluestreet.com/post/office-templates-and-globaldotname-a-stealthy-office-persistence-technique)

Word Normal.dotm location:  
`C:\Users\<username>\AppData\Roaming\Microsoft\Templates\Normal.dotm`

Excel Personal.xlsb location:  
`C:\Users\<username>\AppData\Roaming\Microsoft\Excel\XLSTART\PERSONAL.XLSB`

Adversaries may also change the location of the base template to point to their own by hijacking the application's search order, e.g. Word 2016 will first look for Normal.dotm under `C:\Program Files (x86)\Microsoft Office\root\Office16\`, or by modifying the GlobalDotName registry key. By modifying the GlobalDotName registry key an adversary can specify an arbitrary location, file name, and file extension to use for the template that will be loaded on application startup. To abuse GlobalDotName, adversaries may first need to register the template as a trusted document or place it in a trusted location.[5](https://www.221bluestreet.com/post/office-templates-and-globaldotname-a-stealthy-office-persistence-technique)

An adversary may need to enable macros to execute unrestricted depending on the system or enterprise security policy on use of macros.

#### Office Test - T1137.002
[more on T1137.002](https://attack.mitre.org/techniques/T1137/002)

Adversaries may abuse the Microsoft Office "Office Test" Registry key to obtain persistence on a compromised system. An Office Test Registry location exists that allows a user to specify an arbitrary DLL that will be executed every time an Office application is started. This Registry key is thought to be used by Microsoft to load DLLs for testing and debugging purposes while developing Office applications. This Registry key is not created by default during an Office installation.[1](http://www.hexacorn.com/blog/2014/04/16/beyond-good-ol-run-key-part-10/)[2](https://researchcenter.paloaltonetworks.com/2016/07/unit42-technical-walkthrough-office-test-persistence-method-used-in-recent-sofacy-attacks/)

There exist user and global Registry keys for the Office Test feature:

-   `HKEY_CURRENT_USER\Software\Microsoft\Office test\Special\Perf`
-   `HKEY_LOCAL_MACHINE\Software\Microsoft\Office test\Special\Perf`

Adversaries may add this Registry key and specify a malicious DLL that will be executed whenever an Office application, such as Word or Excel, is started.

#### Outlook Forms - T1137.003
[more on T1137.003](https://attack.mitre.org/techniques/T1137/003)

Adversaries may abuse Microsoft Outlook forms to obtain persistence on a compromised system. Outlook forms are used as templates for presentation and functionality in Outlook messages. Custom Outlook forms can be created that will execute code when a specifically crafted email is sent by an adversary utilizing the same custom Outlook form.[1](https://sensepost.com/blog/2017/outlook-forms-and-shells/)

Once malicious forms have been added to the user’s mailbox, they will be loaded when Outlook is started. Malicious forms will execute when an adversary sends a specifically crafted email to the user.[1](https://sensepost.com/blog/2017/outlook-forms-and-shells/)

#### Outlook Home Page - T1137.004
[more on T1137.004](https://attack.mitre.org/techniques/T1137/004)

Adversaries may abuse Microsoft Outlook's Home Page feature to obtain persistence on a compromised system. Outlook Home Page is a legacy feature used to customize the presentation of Outlook folders. This feature allows for an internal or external URL to be loaded and presented whenever a folder is opened. A malicious HTML page can be crafted that will execute code when loaded by Outlook Home Page.[1](https://sensepost.com/blog/2017/outlook-home-page-another-ruler-vector/)

Once malicious home pages have been added to the user’s mailbox, they will be loaded when Outlook is started. Malicious Home Pages will execute when the right Outlook folder is loaded/reloaded.[1](https://sensepost.com/blog/2017/outlook-home-page-another-ruler-vector/)

#### Outlook Rules - T1137.005
[more on T1137.005](https://attack.mitre.org/techniques/T1137/005)

Adversaries may abuse Microsoft Outlook rules to obtain persistence on a compromised system. Outlook rules allow a user to define automated behavior to manage email messages. A benign rule might, for example, automatically move an email to a particular folder in Outlook if it contains specific words from a specific sender. Malicious Outlook rules can be created that can trigger code execution when an adversary sends a specifically crafted email to that user.[1](https://silentbreaksecurity.com/malicious-outlook-rules/)

Once malicious rules have been added to the user’s mailbox, they will be loaded when Outlook is started. Malicious rules will execute when an adversary sends a specifically crafted email to the user.[1](https://silentbreaksecurity.com/malicious-outlook-rules/)

#### Add-ins - T1137.006
[more on T1137.006](https://attack.mitre.org/techniques/T1137/006)

Adversaries may abuse Microsoft Office add-ins to obtain persistence on a compromised system. Office add-ins can be used to add functionality to Office programs. [1](https://support.office.com/article/Add-or-remove-add-ins-0af570c4-5cf3-4fa9-9b88-403625a0b460) There are different types of add-ins that can be used by the various Office products; including Word/Excel add-in Libraries (WLL/XLL), VBA add-ins, Office Component Object Model (COM) add-ins, automation add-ins, VBA Editor (VBE), Visual Studio Tools for Office (VSTO) add-ins, and Outlook add-ins. [2](https://labs.mwrinfosecurity.com/blog/add-in-opportunities-for-office-persistence/)[3](https://summit.fireeye.com/content/dam/fireeye-www/summit/cds-2018/presentations/cds18-technical-s03-youve-got-mail.pdf)

Add-ins can be used to obtain persistence because they can be set to execute code when an Office application starts.



