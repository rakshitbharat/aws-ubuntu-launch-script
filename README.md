# AWS Ubuntu Launch Script

This repository hosts a script designed to configure a new Ubuntu server on AWS. It automates the setup process, installing necessary tools such as Docker, Docker Compose, and the AWS CLI, and configures SSH for password-based authentication.

## Features

- Updates and upgrades the Ubuntu system.
- Configures SSH to allow password authentication.
- Creates a non-root user with sudo privileges.
- Installs Docker and Docker Compose, allowing commands without `sudo`.
- Installs the AWS CLI for interacting with AWS services.

## How to Use

### Direct Execution

To directly execute the script on an existing Ubuntu instance:

1. **SSH into your Instance**: Connect to your Ubuntu instance using SSH.

2. **Download the Script**: Use the following command to download the script:

    ```bash
    wget https://github.com/rakshitbharat/aws-ubuntu-launch-script/raw/main/launch.sh
    ```

3. **Make the Script Executable**:

    ```bash
    chmod +x launch.sh
    ```

4. **Run the Script**: Execute the script with sudo:

    ```bash
    sudo ./launch.sh
    ```

### Automated Setup Using EC2 User Data

For a hands-off setup when launching a new EC2 instance, you can use this script as part of the EC2 user data.

1. **Prepare User Data**: Copy the following script into the user data text box in the EC2 launch wizard:

    ```bash
    #!/bin/bash
    wget https://github.com/rakshitbharat/aws-ubuntu-launch-script/raw/main/launch.sh
    chmod +x launch.sh
    sudo ./launch.sh
    ```

2. **Launch the Instance**: Proceed with the instance setup in the AWS Management Console. In the **Configure Instance** step, paste the above script into the **User Data** section under **Advanced Details**.

This will execute the script automatically upon instance initialization, configuring everything without further manual intervention.

## Customization

Before using the script, you can customize the default SSH user password by editing the script. Locate the `USER_PASSWORD="YourPasswordHere"` line and replace `"YourPasswordHere"` with your desired password.

## Security Notice

The script configures SSH to permit password authentication. Consider using SSH key-based authentication for better security once the server is set up. Ensure you understand the implications of enabling password authentication over SSH.

## Contributions

Contributions to improve the script or documentation are welcome. Please feel free to fork the repository, make changes, and submit a pull request.

## License

This script and documentation are made available under the MIT License. See the LICENSE file in the repository for full details.
