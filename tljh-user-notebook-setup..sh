#!/bin/bash

# Get the username from the environment variable
username=$1

# Path to the repo containing the notebooks you want to provision
repo_url="https://github.com/victorolet/sleep-graph.git"
repo_path="/home/$username/notebooks"

# Clone the repo to the user's home directory
if [ ! -d "$repo_path" ]; then
    echo "Provisioning notebooks for user $username"
    git clone "$repo_url" "$repo_path"
    chown -R "$username:users" "$repo_path"
else
    echo "Notebooks already provisioned for user $username"
fi