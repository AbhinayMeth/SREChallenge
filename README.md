# SREChallenge
code for SRE Challenge


This code is for the challenge based on the below scenerio 

For this project, please think about how you would architect a scalable and secure static web application in AWS or another IaaS provider.


•	Create and deploy a running instance of a web server using a configuration management tool of your choice. The web server should serve one page with basic HTML page.

•	Secure this application and host such that only appropriate ports are publicly exposed and any http requests are redirected to https. This should be automated using a configuration management tool of your choice and you should feel free to use a self-signed certificate for the web server.

•	Develop and apply automated tests to validate the correctness of the server configuration.
======================================================================================================================================

SRE_Challenge_setup.sh
==========================

. This is a bash script , where it takes care of the basic installation of AWS cli, Chef workstation set up and installs knife-ec2 gem package.

. then it the basic default VPC , subnet, SG from AWS to spin a free trire Centos server and confirgure all above and install apache with SSL enabled.
