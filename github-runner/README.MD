# DevOpsDani Github Runner
## _About_
[![Build Status](https://github.com/github/docs/actions/workflows/main.yml/badge.svg?branch=feature-1)](https://github.com/devopsdani/cicd)
This tool enables you to connect your machine on your infrastructure into github workflow, as a self-hosted agent.

## _Installation_

- __Use__ _./build.sh_ __to build the docker image__ (optionally, push it to your container registry)
- Get your token for one of your repos like this: ![1](https://raw.githubusercontent.com/devopsdani/cicd/main/github-runner/assets/1.PNG) ![2](https://raw.githubusercontent.com/devopsdani/cicd/main/github-runner/assets/2.PNG) 
- __Start an instance of the built image, your repo URL and the copied TOKEN as env vars are mandatory! Example:__ _docker run --restart=unless-stopped -it --name github-runner -e ___URL___=https://github.com/devopsdani/cicd -e ___TOKEN___=0123456789 github-runner>_
- Check the status on the Runners menupoint again, it should be "Idle"
