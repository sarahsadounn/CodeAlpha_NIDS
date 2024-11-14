#!/bin/bash

# Update system packages
sudo apt update && sudo apt upgrade -y

# Install Snort
sudo apt install -y snort

# Set up Snort configuration for the HOME_NET
echo "Configuring Snort..."
sudo sed -i 's/^ipvar HOME_NET any/ipvar HOME_NET <YOUR_UBUNTU_VM_IP>/' /etc/snort/snort.conf

# Copy custom rules to Snort's rules directory
echo "Adding custom rules..."
sudo cp ../rules/custom_snort.rules /etc/snort/rules/

# Include custom rules in snort.conf
echo "include \$RULE_PATH/custom_snort.rules" | sudo tee -a /etc/snort/snort.conf

# Restart Snort
echo "Restarting Snort..."
sudo systemctl restart snort

echo "Snort installation and configuration completed!"
