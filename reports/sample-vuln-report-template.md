# Vulnerability Scan Report

**Scanned by**: Likhith Vancha  
**Date**: 2025-09-25  
**Tool(s) used**: Nmap (7.95) with Vulners NSE  
**Target**: 127.0.0.1

---

## Summary
- Hosts scanned: 1  
- Total findings: 3  
- High severity: 1  
- Medium severity: 1  
- Low severity: 1  

---

## Top 3 Vulnerabilities

1. **CVE-2021-42013 — Apache HTTP Path Traversal & RCE**  
   - Severity: Critical (CVSS: 9.8)  
   - Description: Apache HTTP Server 2.4.29 is vulnerable to path traversal and potential remote code execution via specially crafted requests.  
   - Evidence: Detected via Nmap service scan on port 80 (`Apache/2.4.29`).  
   - Remediation: Upgrade Apache to 2.4.51 or later, apply vendor patches, and harden configuration (disable directory listings, validate request handling).

2. **CVE-2019-6111 — OpenSSH SFTP Directory Traversal**  
   - Severity: High (CVSS: 7.5)  
   - Description: An issue in OpenSSH's SFTP server can allow a malicious SFTP server to write files outside of the intended directory when the client is acting as a server.  
   - Evidence: Detected via Nmap on port 22 (`OpenSSH 7.6p1`).  
   - Remediation: Update OpenSSH to the latest secure version (>= 8.2 where patched), and apply OS vendor updates.

3. **CVE-2020-14145 — OpenSSH User Enumeration**  
   - Severity: Medium (CVSS: 5.3)  
   - Description: Vulnerability allows remote attackers to enumerate valid usernames via authentication responses.  
   - Evidence: OpenSSH 7.6p1 detected on port 22.  
   - Remediation: Patch OpenSSH, enforce account lockout policies, and reduce information leakage in authentication responses.

---

## Full Findings

### 1. Apache HTTP Path Traversal & RCE
- **CVE**: CVE-2021-42013  
- **Severity**: Critical (CVSS: 9.8)  
- **Evidence**: `nmap` service detection reported `Apache/2.4.29` on TCP/80.  
- **Remediation**: Update Apache to version 2.4.51 or newer; apply vendor hotfixes; audit web application code for unsafe file handling.

### 2. OpenSSH SFTP Directory Traversal
- **CVE**: CVE-2019-6111  
- **Severity**: High (CVSS: 7.5)  
- **Evidence**: `nmap` detected `OpenSSH 7.6p1` on TCP/22.  
- **Remediation**: Upgrade OpenSSH to a patched version available via OS updates; follow vendor guidance.

### 3. OpenSSH User Enumeration
- **CVE**: CVE-2020-14145  
- **Severity**: Medium (CVSS: 5.3)  
- **Evidence**: `nmap` output shows `OpenSSH 7.6p1`.  
- **Remediation**: Patch OpenSSH, configure authentication throttling and logging, and minimize exposure of SSH service where possible.

---

## Risk Prioritization
1. **Apache RCE (Critical)** — Internet-facing service; remote code execution risk requires immediate remediation.  
2. **OpenSSH SFTP (High)** — Potential directory traversal and data integrity risk.  
3. **OpenSSH User Enumeration (Medium)** — Information disclosure; lower immediate exploitability but should be addressed during patching.

---

## Remediation Plan
- **Immediate (0–7 days)**:
  - Patch Apache (upgrade to ≥2.4.51).
  - Patch OpenSSH via OS package manager.
  - Restrict remote access to services using firewall rules or VPN.
- **Short term (1–4 weeks)**:
  - Harden service configurations (disable unused modules, enforce strong auth).
  - Implement monitoring and log analysis for suspicious activity.
- **Long term**:
  - Schedule monthly vulnerability scans.
  - Implement automated patch management where possible.
  - Periodic penetration testing and security awareness.

---

## Appendices
- Raw scan output: `reports/example-nmap-vuln-output.txt`  
- Command used:  
  - `./scan-scripts/run-nmap-vulnscan.sh 127.0.0.1`
