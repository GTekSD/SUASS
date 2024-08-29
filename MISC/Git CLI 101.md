# Git Command Line Guide >_

Welcome to the Git CLI Guide! This document will walk you through the essential commands and workflows for using Git from the command line. Whether you're new to Git or just need a refresher, this guide will help you manage your repositories effectively.

## Table of Contents

- [Getting Started](#getting-started)
- [Setting Up Git](#setting-up-git)
- [Generating a new SSH key](#Generating-a-new-SSH-key)
- [Basic Git Commands](#basic-git-commands)
- [Branching](#branching)
- [Merging](#merging)
- [Rebasing](#rebasing)
- [Stashing Changes](#stashing-changes)
- [Working with Remote Repositories](#working-with-remote-repositories)
- [Undoing Changes](#undoing-changes)
- [Git Best Practices](#git-best-practices)
- [Resources](#resources)

## Getting Started

Git is a distributed version control system that allows multiple developers to work on a project simultaneously. To begin using Git, you’ll need to have it installed on your system.

### Installation

- **Windows**: Download and install Git from [git-scm.com](https://git-scm.com/download/win).
- **macOS**: Install Git via Homebrew using `brew install git`.
- **Linux**: Install Git using your package manager (e.g., `sudo apt-get install git` on Ubuntu).

Verify the installation by running:
```bash
git --version
```

## Setting Up Git

Before you start using Git, configure your name and email address. These details will be associated with your commits.

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

You can check your configuration with:
```bash
git config --list
```

## Generating a new SSH key

1. Open Terminal.
2. Paste the command below, replacing the email used in the example with your GitHub email address.
  ```powershell
  ssh-keygen -t ed25519 -C "your_email@example.com"
  ```

Note: If you are using a legacy system that doesn't support the Ed25519 algorithm, use:
  ```powershell
  ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
  ```
This creates a new SSH key, using the provided email as a label.

Note: When you're prompted to "Enter a file in which to save the key", you can press Enter to accept the default file location. Please note that if you created SSH keys previously, ssh-keygen may ask you to rewrite another key, in which case we recommend creating a custom-named SSH key. To do so, type the default file location and replace id_ALGORITHM with your custom key name.

```powershell
PS C:\Users\gteksd> ssh-keygen -t ed25519 -C "gteksd@gmail.com"
Generating public/private ed25519 key pair.
Enter file in which to save the key (C:\Users\gteksd/.ssh/id_ed25519):
Created directory 'C:\\Users\\gteksd/.ssh'.
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in C:\Users\gteksd/.ssh/id_ed25519
Your public key has been saved in C:\Users\gteksd/.ssh/id_ed25519.pub
The key fingerprint is:
SHA256:O4E9tldkC6t/n1yu6zCD1kvY7hzpai53Tjy7cMiq+e0 gteksd@gmail.com
The key's randomart image is:
+--[ED25519 256]--+
|                 |
|                 |
|          . o    |
|       o   = .   |
|      . S . o    |
|       . B O .   |
|        = O #   .|
|       ..BoOoX + |
|      ooo*E*X+Bo.|
+----[SHA256]-----+
```

3. Copy the Generated public key:
   ```powershell
   PS C:\Users\gteksd> cat C:\Users\suhas/.ssh/id_ed25519.pub
   ssh-ed25519 AAAAC3NzaC1wefZDIsdfweNTE53e3AIJxDiP13S3c4f8I+0DApQEtgMjs8V5QzHomWmfK9gjo gteksd@gmail.com
   ```
4. Open the direct link https://github.com/settings/ssh/new to add generated SSH key to your GitHub account.
5. Give a Title, Key type: Auth.. Key and Paste the copied key into the key.

## Basic Git Commands

Create a New Repo on GitHub and ..
### …or create a new repository on the command line
```
echo "# My New Repo" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:username/My-New-repo.git
git push -u origin main
```
### …or push an existing repository from the command line
```
git remote add origin git@github.com::username/My-New-repo.git
git branch -M main
git push -u origin main
```

### Initializing a Repository

To start tracking a project with Git, initialize a new repository:
```bash
git init
```

### Cloning a Repository

To clone an existing repository from a remote source:
```bash
git clone <repository-url>
```

### Adding Changes

To stage changes for commit:
```bash
git add <file-path>
```
To stage all changes:
```bash
git add .
```

### Committing Changes

To commit your staged changes with a message:
```bash
git commit -m "Your commit message"
```

### Viewing Commit History

To see the commit history:
```bash
git log
```

## Branching

Branches allow you to work on different features or fixes separately from the main codebase.

### Creating a Branch

To create a new branch:
```bash
git branch <branch-name>
```

### Switching Branches

To switch to a different branch:
```bash
git checkout <branch-name>
```

### Creating and Switching in One Step

To create and switch to a new branch in one command:
```bash
git checkout -b <branch-name>
```

## Merging

Once your feature or fix is complete, you can merge it back into the main branch.

### Merging a Branch

To merge a branch into your current branch:
```bash
git merge <branch-name>
```

## Rebasing

Rebasing allows you to reapply commits on top of another base tip.

### Rebase Your Branch

To rebase your current branch onto another branch:
```bash
git rebase <branch-name>
```

## Stashing Changes

If you need to save your changes temporarily without committing, you can use Git stash.

### Stashing Your Changes

To stash changes:
```bash
git stash
```

### Applying Stashed Changes

To apply stashed changes:
```bash
git stash apply
```

## Working with Remote Repositories

### Adding a Remote

To add a remote repository:
```bash
git remote add <remote-name> <repository-url>
```

### Pushing Changes

To push changes to a remote repository:
```bash
git push <remote-name> <branch-name>
```

### Pulling Changes

To pull changes from a remote repository:
```bash
git pull <remote-name> <branch-name>
```

## Undoing Changes

### Resetting a File

To unstage a file:
```bash
git reset <file-path>
```

### Reverting a Commit

To revert a specific commit:
```bash
git revert <commit-hash>
```

### Resetting a Branch

To reset a branch to a specific commit:
```bash
git reset --hard <commit-hash>
```
