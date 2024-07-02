# Swish Analytics

## Container Image
I have developed a base image that supports Python2.7, Python3, and R languages.

### Build Duration
`2:20.84`

### Build Approach
1. I have chosen to use an Alpine base image for its minimalistic support and ease of maintenance. This will provide us with better control over the image as packages will need continous vulnerability management. 

2. Choosing an official image with built-in Python 2 support could improve build times, but it sacrifices long-term vulnerability management. I would recommend prioritizing the update of legacy codebases from Python 2 to Python 3 as Python2 support reached EOL in 2020

