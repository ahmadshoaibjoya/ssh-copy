#!/bin/bash
: '
Script Name: ssh-copy
Author: Ahmad Shoaib Joya
Date: 26.06.2023
Version: v1.0.0
Descriptioin: This script is for Copying the SSH Key to the remote Hosts with same username and password.
'
 
# The Script requires your inventory file as input. Your inventory file must have IPs of remote hosts.  

# You need to change the key_path variable to your ssh key path.
key_path="/home/ahmadshoaibjoya/.ssh/id_ed25519.pub"

inventory=$1
if [[ ! -f $inventory ]]
then
	echo "You did assign the Inventory file as Input."
	exit
fi

echo "The $key_path key will be copied to the hosts."
echo "Enter Hosts Username."
read -p "Username: " username

echo "Enter Hosts Password."
read -s -p "Password: " password

echo "Your Inventory file: $inventory"
hosts=$(awk '/^([0-9]{1,3}\.){3}[0-9]{1,3}/ { print $1 }' $inventory)
while read ip
do	
	echo -e "\033[32m========>\033[0m" "\033[1;31m$ip\033[0m"
	sshpass -p $password ssh-copy-id -o StrictHostKeyChecking=no -i $key_path $username@$ip
done <<< $hosts

