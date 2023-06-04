# Docker_ACServer
This project provides an easy and convenient way to run an Assetto Corsa server in a Docker container, making it simple to set up and run the server on any machine. The Docker container includes all the necessary dependencies and configurations to run the server, allowing for easy deployment and maintenance.

## How to run it

- Clone this project repository.
- Install Docker on your machine, if you haven't already.
- Open a terminal or command prompt and navigate to the project directory.
- Drop your server files pack that you got from Content Manager into `srcs/server_files`
  - [How to Get Server Files](https://zap-hosting.com/guides/docs/assettocorsa-contentmanager/)
  - If you want to set up AI in your server, drop your map's ai spline into `srcs/server_files/ai`
- Run: `make` if you want AI options.
- Run: `make no_ai` if you don't want AI options.
- Run `make status` to check your container's status.
- Run `make clean` to shut down your container and clean the cache associated with it.
