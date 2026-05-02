#!/usr/bin/env python3

"""
log_parser.py

Parses a Linux authentication log and reports failed login attempts.
"""

import sys
from collections import Counter


def parse_failed_logins(log_file_path):
    failed_users = Counter()
    failed_ips = Counter()
    total_failed = 0

    try:
        with open(log_file_path, "r", encoding="utf-8", errors="ignore") as log_file:
            for line in log_file:
                if "Failed password" in line:
                    total_failed += 1

                    parts = line.split()

                    if "for" in parts:
                        user_index = parts.index("for") + 1
                        if user_index < len(parts):
                            failed_users[parts[user_index]] += 1

                    if "from" in parts:
                        ip_index = parts.index("from") + 1
                        if ip_index < len(parts):
                            failed_ips[parts[ip_index]] += 1

    except FileNotFoundError:
        print(f"Error: File not found: {log_file_path}")
        sys.exit(1)

    return total_failed, failed_users, failed_ips


def print_report(total_failed, failed_users, failed_ips):
    print("===== Failed Login Report =====")
    print(f"Total failed login attempts: {total_failed}")
    print()

    print("Failed attempts by user:")
    print("------------------------")
    if failed_users:
        for user, count in failed_users.most_common():
            print(f"{user}: {count}")
    else:
        print("No failed users found.")

    print()

    print("Failed attempts by IP:")
    print("----------------------")
    if failed_ips:
        for ip, count in failed_ips.most_common():
            print(f"{ip}: {count}")
    else:
        print("No failed IPs found.")


def main():
    if len(sys.argv) != 2:
        print("Usage: ./log_parser.py <log_file>")
        print("Example: ./log_parser.py sample_logs/auth.log")
        sys.exit(1)

    log_file_path = sys.argv[1]
    total_failed, failed_users, failed_ips = parse_failed_logins(log_file_path)
    print_report(total_failed, failed_users, failed_ips)


if __name__ == "__main__":
    main()
