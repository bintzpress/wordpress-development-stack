# Readme

This project can be used to easily setup a WordPress development environment using VS Code.

The environment includes a project container to development on that has git, php, wp-cli, node-js, npm, 
grunt, and grunt-init.

It also has phpmyadmin up on http://127.0.0.1:8080 so you can easily administer the database server.
Connect using db as the host and wordpress as the username and password.

VS Code will connect automatically to the projects container as the developer user in ~/Projects. It
will automatically load PHP and JavaScript VS Code extensions to help with your coding.

You can use wp-cli in the terminal in VS Code. Just use wp as the command.

Example type in "wp theme list" into the terminal.

## About Me

My name is Brian Bintz. I am a freelance writer, developer, and trainer.
Check out my profile on (GitHub)[https://www.github.com/bintzpress] for more details on me. If you have any
issues with this project please contact me at brian@bintzpress.com.

## About the Project

This project is an easy way to bring up a containerized development environment for WordPress in VS Code.

## Using the Project

The INSTALL.md tells how to setup the environment.

You can change the tags used for images in the .env file.

If you run VS Code and then exit then the containers remain. This causes a problem if you change the
tags in .env. You'll need to do a "docker container prune" to remove the stopped containers. This is 
necessary because docker uses the same container names between runs. This will mean that they'll keep
the same mount points unless they are removed using prune. They'll be recreated when you connect in
VS Code again.
