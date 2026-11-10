# IT Infrastructure Labs

Notes, scripts and configuration examples from my home lab.

I use this repository to keep practical examples in one place, document what I learn and make repeatable tasks easier. The examples are intended for test environments. They should be reviewed and adapted before being used on a live system.

## Contents

| Folder | What's inside |
|---|---|
| `powershell/` | Small scripts for Windows administration and reporting |
| `active-directory/` | Example user and group export, OU planning and notes |
| `networking/` | IP plan, VLAN example and troubleshooting notes |
| `backup/` | Backup checks and a recovery checklist |
| `documentation/` | Lab setup notes and diagrams to add |

## Lab environment

Add the details of your actual setup here, for example:

- Hypervisor: [Hyper-V / VirtualBox / VMware]
- Client OS: [Windows 11]
- Server OS: [Windows Server version]
- Network: [describe your private lab network]

## Running the scripts

1. Read the script before running it.
2. Use a test machine or lab environment.
3. Open PowerShell with only the permissions the task requires.
4. Update paths, names and settings for your environment.
5. Check the output and record any changes you make.

Scripts that use Active Directory require the ActiveDirectory PowerShell module and suitable permissions.

## Notes

- No production data, passwords, tokens or private configuration belongs in this repository.
- Replace example domains, usernames and IP addresses with values from your own isolated lab.
- Screenshots and diagrams should show your own test environment, with sensitive details removed.

## Further reading

- [Active Directory PowerShell module](https://learn.microsoft.com/powershell/module/activedirectory/)
- [Exchange Online PowerShell](https://learn.microsoft.com/powershell/exchange/exchange-online-powershell-v2)
