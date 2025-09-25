# Common Remediation Steps

1. **Apply OS patches**
   - Windows: Settings → Update & Security → Check for updates → Install.
   - Debian/Ubuntu: `sudo apt update && sudo apt upgrade -y`
   - RHEL/CentOS: `sudo yum update -y`

2. **Disable unused services**
   - Check listening ports: `ss -tuln` or `netstat -tuln`
   - Stop/disable service: `sudo systemctl stop <service>` && `sudo systemctl disable <service>`

3. **Upgrade outdated software**
   - Use OS package manager or vendor installers to upgrade Apache, OpenSSH, etc.

4. **Restrict access**
   - Place SSH/RDP behind a VPN or allow only specific IPs via firewall.
   - Use UFW / firewalld / Windows Firewall to close unnecessary ports.

5. **Harden configurations**
   - Disable directory listing in web servers.
   - Use key-based SSH auth and disable password auth where possible.
   - Limit SSH root login: `PermitRootLogin no`.

6. **Use strong credentials & MFA**
   - Enforce complex passwords and multi-factor authentication where supported.

7. **Monitoring & backups**
   - Enable logging, centralize logs, and implement regular backups before applying major updates.
