Tactics: [[CREDENTIAL_ACCESS]]
Tags: #mitre/attack/techniques/T1187  

# Forced Authentication - T1187
---
## Description
[more on T1187](https://attack.mitre.org/techniques/T1187)

Adversaries may gather credential material by invoking or forcing a user to automatically provide authentication information through a mechanism in which they can intercept.

The Server Message Block (SMB) protocol is commonly used in Windows networks for authentication and communication between systems for access to resources and file sharing. When a Windows system attempts to connect to an SMB resource it will automatically attempt to authenticate and send credential information for the current user to the remote system. [1](https://en.wikipedia.org/wiki/Server_Message_Block) This behavior is typical in enterprise environments so that users do not need to enter credentials to access network resources.

Web Distributed Authoring and Versioning (WebDAV) is also typically used by Windows systems as a backup protocol when SMB is blocked or fails. WebDAV is an extension of HTTP and will typically operate over TCP ports 80 and 443. [2](https://blog.didierstevens.com/2017/11/13/webdav-traffic-to-malicious-sites/) [3](https://www.microsoft.com/technet/prodtechnol/WindowsServer2003/Library/IIS/4beddb35-0cba-424c-8b9b-a5832ad8e208.mspx)

Adversaries may take advantage of this behavior to gain access to user account hashes through forced SMB/WebDAV authentication. An adversary can send an attachment to a user through spearphishing that contains a resource link to an external server controlled by the adversary (i.e. [[T1221_Template Injection|Template Injection (T1221)]]), or place a specially crafted file on navigation path for privileged accounts (e.g. .SCF file placed on desktop) or on a publicly accessible share to be accessed by victim(s). When the user's system accesses the untrusted resource it will attempt authentication and send information, including the user's hashed credentials, over SMB to the adversary controlled server. [4](https://github.com/hob0/hashjacking) With access to the credential hash, an adversary can perform off-line [[T1110_Brute Force|Brute Force (T1110)]] cracking to gain access to plaintext credentials. [5](https://www.cylance.com/content/dam/cylance/pdfs/white_papers/RedirectToSMB.pdf)

There are several different ways this can occur. [6](https://osandamalith.com/2017/03/24/places-of-interest-in-stealing-netntlm-hashes/) Some specifics from in-the-wild use include:

-   A spearphishing attachment containing a document with a resource that is automatically loaded when the document is opened (i.e. [[T1221_Template Injection|Template Injection (T1221)]]). The document can include, for example, a request similar to `file[:]//[remote address]/Normal.dotm` to trigger the SMB request. [7](https://www.us-cert.gov/ncas/alerts/TA17-293A)
-   A modified .LNK or .SCF file with the icon filename pointing to an external reference such as `\[remote address]\pic.png` that will force the system to load the resource when the icon is rendered to repeatedly gather credentials. [7](https://www.us-cert.gov/ncas/alerts/TA17-293A)

---
## Sub-Techniques

#### none
