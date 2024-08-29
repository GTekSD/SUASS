# Git command line guide >_

## Generating a new SSH key

1. Open Terminal.
2. Paste the command below, replacing the email used in the example with your GitHub email address.
  ```
  ssh-keygen -t ed25519 -C "your_email@example.com"
  ```

Note: If you are using a legacy system that doesn't support the Ed25519 algorithm, use:
  ```
  ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
  ```
This creates a new SSH key, using the provided email as a label.

Note: When you're prompted to "Enter a file in which to save the key", you can press Enter to accept the default file location. Please note that if you created SSH keys previously, ssh-keygen may ask you to rewrite another key, in which case we recommend creating a custom-named SSH key. To do so, type the default file location and replace id_ALGORITHM with your custom key name.
