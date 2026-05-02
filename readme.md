# Linux Scripting Automation Lab

This project is a hands-on Linux automation lab using Bash and Python.

## Skills Practiced

- Linux command line
- Bash scripting
- Python scripting
- File permissions
- Git version control
- Cron jobs
- Log parsing
- System monitoring

## Scripts

| Script | Description |
|---|---|
| `backup.sh` | Creates a compressed backup of a target directory |
| `disk_check.sh` | Checks disk usage and warns if usage is high |
| `user_audit.sh` | Lists local users and login shell information |
| `service_check.sh` | Checks whether a Linux service is active |
| `log_parser.py` | Parses authentication logs for failed login attempts |

## Backup Script Example

```bash
./scripts/backup.sh test_data backups
