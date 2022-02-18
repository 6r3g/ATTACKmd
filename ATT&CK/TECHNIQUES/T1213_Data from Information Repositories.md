Tactics: [[COLLECTION]]
Tags: #mitre/attack/techniques/T1213  

# Data from Information Repositories - T1213
---
## Description
[more on T1213](https://attack.mitre.org/techniques/T1213)

Adversaries may leverage information repositories to mine valuable information. Information repositories are tools that allow for storage of information, typically to facilitate collaboration or information sharing between users, and can store a wide variety of data that may aid adversaries in further objectives, or direct access to the target information. Adversaries may also abuse external sharing features to share sensitive documents with recipients outside of the organization.

The following is a brief list of example information that may hold potential value to an adversary and may also be found on an information repository:

-   Policies, procedures, and standards
-   Physical / logical network diagrams
-   System architecture diagrams
-   Technical system documentation
-   Testing / development credentials
-   Work / project schedules
-   Source code snippets
-   Links to network shares and other internal resources

Information stored in a repository may vary based on the specific instance or environment. Specific common information repositories include web-based platforms such as [[T1213_Data from Information Repositories#Sharepoint - T1213 002|Sharepoint (T1213.002)]] and [[T1213_Data from Information Repositories#Confluence - T1213 001|Confluence (T1213.001)]], specific services such as Code Repositories, IaaS databases, enterprise databases, and other storage infrastructure such as SQL Server.

---
## Sub-Techniques

#### Confluence - T1213.001
[more on T1213.001](https://attack.mitre.org/techniques/T1213/001)

Adversaries may leverage Confluence repositories to mine valuable information. Often found in development environments alongside Atlassian JIRA, Confluence is generally used to store development-related documentation, however, in general may contain more diverse categories of useful information, such as:

-   Policies, procedures, and standards
-   Physical / logical network diagrams
-   System architecture diagrams
-   Technical system documentation
-   Testing / development credentials
-   Work / project schedules
-   Source code snippets
-   Links to network shares and other internal resources

#### Sharepoint - T1213.002
[more on T1213.002](https://attack.mitre.org/techniques/T1213/002)

Adversaries may leverage the SharePoint repository as a source to mine valuable information. SharePoint will often contain useful information for an adversary to learn about the structure and functionality of the internal network and systems. For example, the following is a list of example information that may hold potential value to an adversary and may also be found on SharePoint:

-   Policies, procedures, and standards
-   Physical / logical network diagrams
-   System architecture diagrams
-   Technical system documentation
-   Testing / development credentials
-   Work / project schedules
-   Source code snippets
-   Links to network shares and other internal resources

#### Code Repositories - T1213.003
[more on T1213.003](https://attack.mitre.org/techniques/T1213/003)

Adversaries may leverage code repositories to collect valuable information. Code repositories are tools/services that store source code and automate software builds. They may be hosted internally or privately on third party sites such as Github, GitLab, SourceForge, and BitBucket. Users typically interact with code repositories through a web application or command-line utilities such as git.

Once adversaries gain access to a victim network or a private code repository, they may collect sensitive information such as proprietary source code or credentials contained within software's source code. Having access to software's source code may allow adversaries to develop [[T1587_Develop Capabilities#Exploits - T1587 004|Exploits (T1587.004)]], while credentials may provide access to additional resources using [[T1078_Valid Accounts|Valid Accounts (T1078)]].[1](https://www.wired.com/story/uber-paid-off-hackers-to-hide-a-57-million-user-data-breach/)[2](https://krebsonsecurity.com/2013/10/adobe-to-announce-source-code-customer-data-breach/)



