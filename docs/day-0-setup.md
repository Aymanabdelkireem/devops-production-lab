# Day 0 - Environment Setup

## Goal

Prepare the local environment for the DevOps Production Lab.

## Tools Needed

- Git
- Docker
- Docker Compose
- Python
- Make
- jq
- tree
- kubectl
- kind
- Helm
- Terraform
- Trivy

## Validation Commands

```bash
git --version
docker --version
docker compose version
python3 --version
make --version
kubectl version --client
kind version
helm version
terraform version
trivy --version
```

## Current Status

### Installed

- Git
- Python
- Make
- jq
- tree

### Missing

- Docker
- Docker Compose
- kubectl
- kind
- Helm
- Terraform
- Trivy

## Issues Faced

### Issue 1: Heredoc interrupted

I started creating this file using:

```bash
cat > docs/day-0-setup.md <<'EOF'
```

But interrupted it with Ctrl+C before closing EOF.

### Fix

Recreate the file and close the heredoc using EOF on a separate line.

### Issue 2: Git push failed

Error:

```text
error: src refspec main does not match any
```

### Cause

The repository had no commits yet, so Git could not push the main branch.

### Fix

Run:

```bash
git add .
git commit -m "day-0: initialize devops production lab"
git push -u origin main
```

### Issue 3: Remote origin already exists

Error:

```text
error: remote origin already exists.
```

### Cause

The GitHub remote was already added.

### Fix

Check it with:

```bash
git remote -v
```

Do not add the same origin again.

## GitHub SSH Authentication

### Problem

Pushing with HTTPS failed because GitHub does not support password authentication for Git operations.

### Error

```text
remote: Invalid username or token. Password authentication is not supported for Git operations.
fatal: Authentication failed
```

### Fix

Use SSH instead of HTTPS.

Commands used:

```bash
ssh -T git@github.com
git remote set-url origin git@github.com:Aymanabdelkireem/devops-production-lab.git
git push -u origin main
```

### Result

SSH authentication worked successfully and the local `main` branch was pushed to GitHub.
