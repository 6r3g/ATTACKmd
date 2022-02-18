Tactics: [[DEFENSE_EVASION]]
Tags: #mitre/attack/techniques/T1221  

# Template Injection - T1221
---
## Description
[more on T1221](https://attack.mitre.org/techniques/T1221)

Adversaries may create or modify references in Office document templates to conceal malicious code or force authentication attempts. Microsoft’s Office Open XML (OOXML) specification defines an XML-based format for Office documents (.docx, xlsx, .pptx) to replace older binary formats (.doc, .xls, .ppt). OOXML files are packed together ZIP archives compromised of various XML files, referred to as parts, containing properties that collectively define how a document is rendered. [1](https://docs.microsoft.com/previous-versions/office/developer/office-2007/aa338205(v=office.12))

Properties within parts may reference shared public resources accessed via online URLs. For example, template properties reference a file, serving as a pre-formatted document blueprint, that is fetched when the document is loaded.

Adversaries may abuse this technology to initially conceal malicious code to be executed via documents. Template references injected into a document may enable malicious payloads to be fetched and executed when the document is loaded. [2](https://www.sans.org/reading-room/whitepapers/testing/template-injection-attacks-bypassing-security-controls-living-land-38780) These documents can be delivered via other techniques such as [[T1566_Phishing|Phishing (T1566)]] and/or [[T1080_Taint Shared Content|Taint Shared Content (T1080)]] and may evade static detections since no typical indicators (VBA macro, script, etc.) are present until after the malicious payload is fetched. [3](http://blog.redxorblue.com/2018/07/executing-macros-from-docx-with-remote.html) Examples have been seen in the wild where template injection was used to load malicious code containing an exploit. [4](https://blog.malwarebytes.com/threat-analysis/2017/10/decoy-microsoft-word-document-delivers-malware-through-rat/)

This technique may also enable [[T1187_Forced Authentication|Forced Authentication (T1187)]] by injecting a SMB/HTTPS (or other credential prompting) URL and triggering an authentication attempt. [5](https://forum.anomali.com/t/credential-harvesting-and-malicious-file-delivery-using-microsoft-office-template-injection/2104) [6](https://blog.talosintelligence.com/2017/07/template-injection.html) [7](https://github.com/ryhanson/phishery)

---
## Sub-Techniques

#### none