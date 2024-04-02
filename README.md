# AWS Ubuntu Launch Script

This repository contains a script designed to set up a new Ubuntu server on AWS with some essential tools and configurations. The script performs the following actions:
- Updates and upgrades the Ubuntu system.
- Installs and configures SSH for password authentication.
- Creates a non-root user with sudo privileges.
- Installs Docker and Docker Compose.
- Allows the new user to run Docker commands without `sudo`.
- Installs the AWS CLI.

## Prerequisites

Before you begin, ensure you have:
- An AWS account.
- Launched an Ubuntu LTS instance on AWS.
- SSH access to your Ubuntu instance.

## How to Use

1. **Access your Ubuntu Instance**: SSH into your Ubuntu instance using your preferred SSH client.

2. **Download the Script**: Use `wget` to download the launch script from this repository to your Ubuntu instance. Replace `launch.sh` with the name of the script file.

    ```bash
    wget https://github.com/rakshitbharat/aws-ubuntu-launch-script/raw/main/launch.sh
    ```

3. **Make the Script Executable**: Change the script's permissions to make it executable.

    ```bash
    chmod +x launch.sh
    ```

4. **Run the Script**: Execute the script. Remember to replace `launch.sh` with the actual script file name. You will need to enter your sudo password.

    ```bash
    sudo ./launch.sh
    ```

## Customization

The script contains a placeholder for setting the SSH user password. Before running the script, you can edit it to set a custom password:

- Open the script in a text editor.
- Locate the `USER_PASSWORD="YourPasswordHere"` line.
- Replace `YourPasswordHere` with your desired password.

## Security Notice

- The script sets SSH to allow password authentication. After you have set up your server, consider configuring SSH key-based authentication for enhanced security.
- Ensure you understand the security implications of enabling password authentication over SSH and take appropriate measures to secure your server.

## Contributions

Contributions are welcome! If you have improvements or bug fixes, please open a pull request.

## License

This script is provided under the MIT License. See the LICENSE file for more details.
