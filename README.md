# Docker_ACServer
This project provides an easy and convenient way to run an Assetto Corsa server in a Docker container, making it simple to set up and run the server on any machine. The Docker container includes all the necessary dependencies and configurations to run the server, allowing for easy deployment and maintenance.

# How to run it
<ul>
<li>Clone this project repository.</li>
<li>Install Docker on your machine, if you haven't already.</li>
<li>Open a terminal or command prompt and navigate to the project directory.</li>
<li>Drop your server files pack that you got from Content Manager into srcs/server_files</li>
  <ul>
  <li>-[[How To get a Server Pack](URL)](https://zap-hosting.com/guides/docs/assettocorsa-contentmanager/)</li>
  <li>-If you want to setup AI in your server, drop your maps ai spline into srcs/server_files/ai</li>
  </ul>
<li>Run: `make` if you want ai options</li>
<li>Run: `make no_ai` if you dont want ai options</li>

<li>Run `make status` to check your container's status</li>
<li>Run `make clean` to shut down your container and clean the cache associated with it</li>
 </ul>
 
