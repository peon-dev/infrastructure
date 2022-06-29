# Peon's infrastructure

Continuous Delivery for Peon's infrastructure.

## How it works

- Using `sed` to replace placeholders with values from secrets
- Upload final file using `rsync`
- Restart service via commands over `ssh`
