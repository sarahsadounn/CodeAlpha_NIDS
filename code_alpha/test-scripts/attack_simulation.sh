#!/bin/bash

# Check if hping3 is installed
if ! command -v hping3 &> /dev/null; then
    echo "Installing hping3..."
    sudo apt install -y hping3
fi

# Define the IP of the Ubuntu VM
TARGET_IP="<YOUR_UBUNTU_VM_IP>"

echo "Simulating ICMP ping..."
hping3 -1 $TARGET_IP -c 5

echo "Simulating SSH brute force..."
for i in {1..10}; do
    hping3 -S -p 22 -c 1 $TARGET_IP
    sleep 1
done

echo "Simulating SYN scan..."
hping3 -S $TARGET_IP -p ++1 -c 10
