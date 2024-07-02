# Swish Analytics

## Container Image
I have developed a base image that supports Python2.7, Python3, and R languages.

[chrisherrera1/swish-analytics](https://hub.docker.com/r/chrisherrera1/swish-analytics/tags)

### Build Duration
`2:20.84`

### Build Approach
1. I have chosen to use an Alpine base image for its minimalistic support and ease of maintenance. This will provide us with better control over the image as packages will need continous vulnerability management. 

2. Choosing an official image with built-in Python 2 support could improve build times, but it sacrifices long-term vulnerability management. I would recommend prioritizing the update of legacy codebases from Python 2 to Python 3 as Python2 support reached EOL in 2020

### Vulnerability Management

I am utilizating the [Aqua Security Trivy](https://github.com/marketplace/actions/aqua-security-trivy#using-trivy-with-github-code-scanning) GHA action. This provides a free vulnerability scanner and should prevent any images with pending high/critical vulnerabilities from getting published. 

### Observability

There are many methods to monitor and observe workloads in Kubernetes. Out of the box we can use the built-in dashboard. If we want to take it a step further we cam instrument our workload and add collectors to the cluster to capture traces and application metrics. This could be completed with a number of solutions like Datadog, SumoLogic, and Prometheus.