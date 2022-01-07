# Install Instructions

## Setup docker-compose environment variables
Copy .env.sample to .env and edit as you'd like

## Setup domain name if want to be internet accessible
Go to a DNS domain registrar and setup a DNS name 

## Setup hosts entry if not using internet access
Add the IP address of the host and the domain name to use
  On Linux edit /etc/hosts
  On Windows edit C:\Windows\System32\drivers\etc\hosts

## Setup HAPPROXY
Do a mkdir -p /srv/haproxy/ssl
Copy haproxy/haproxy-SSL.cfg to /srv/haproxy/haproxy.cfg if using SSL otherwise
copy haproxy/haproxy-NoSSL.cfg to /srv/haproxy/haproxy.cfg
If using SSL copy certs and keys to /srv/haproxy/ssl

## Setup ufw if on Ubuntu and want to restrict remote access
Do a ufw enable
Copy ufw/after.rules to /etc/ufw/after.rules
Edit /etc/ufw/after.rules and change lines for internet IP addresses and docker IP addresses
Do a ufw reload

## Setup VS Code
Install VS Code
Install Remote Container Extension in VS Code

## Bring up Stack 
Click button on bottom left of VS Code to Open a Remote Window
Click Open Folder in Container
Go to the directory where put wordpress-stack project
Click Open
Wait a while because it has to build images
