## The following test was created to evaluate DevSecOps skills 
### General questions - Docker, CVEs, CI/CD, monitoring 

1. Create an image with python2, python3, R, install a set of requirements and upload it to docker hub. 
2. For the previously created image 
    - Share build times 
        - <span style="color:red">Answer is in ReadMe</span>
    - How would you improve build times? 
         - <span style="color:red">Answer is in ReadMe</span>
3. Scan the recently created container and evaluate the CVEs that it might contain. 
    - Create a report of your findings and follow best practices to remediate the CVE 
         - <span style="color:red">GHA workflow integrated as PR check</span>
    - What would you do to avoid deploying malicious packages? 
         - <span style="color:red">Answer is in ReadMe</span>
4. Use the created image to create a kubernetes deployment with a command that will keep the pod running
    - <span style="color:red">Leveraging a Helm chart to manage deployment</span>
5. Expose the deployed resource
    - <span style="color:red">Currently I have the deployment set to create an ingress object but its not tied to any controller for full exposure. Another option would be a nodeport service but that is not best practice to follow.</span>
6. Every step mentioned above have to be in a code repository with automated CI/CD 
7. How would you monitor the above deployment? Explain or implement the tools that you would use 
Project
    - <span style="color:red">Answer is in ReadMe</span>


### Using kubernetes you need to provide all your employees with a way of launching multiple development environments (different base images, requirements, credentials, others). The following are the basic needs for it: 

1. UI, CI/CD, workflow or other tool that will allow people to select options for: 
    - Base image 
        - <span style="color:red">I would recommend using the image previously created as a base image.</span>
    - Packages 
    - Mem/CPU/GPU requests
        - <span style="color:red">Having guardrails such as limitranges on the namespaces would help prevent workloads from overconsuming resources while engineers work to right size their deployments.</span>
2. Monitor each environment and make sure that: 
    - Resources request is accurate (requested vs used)
    - Notify when resources are idle or underutilized
        - <span style="color:red">I have previously leveraged KEDA (Kubernetes Event Driven Autoscaling) for managing dynamic scaling of workloads in Kubernetes. This offers more functionality compared to traditional HPAs, which primarily focus on CPU and memory metrics.</span>
    - Downscale when needed (you can assume any rule defined by you to allow this to happen) 
    -  Save data to track people requests/usage and evaluate performance
        - <span style="color:red">Data collectors like Datadog, Sumologic, or Prometheus/Grafana can assist to track. Also the basic Kubernetes dashboard can help track resource utilization but is limited in its functionality</span> 
3. The cluster needs to automatically handle up/down scaling and have multiple instance groups/taints/tags/others to be chosen from in order to segregate resources usage between teams/resources/projects/others
     - <span style="color:red">The cluster autoscaler would handle the node resizing but need to ensure we have proper pod distruption budgets (PDBs) in place to ensure the workloads go uninterrupted during the autoscaling process. </span>
4. SFTP, SSH or similar access to the deployed environment is needed so DNS handling automation is required 
     - <span style="color:red">Terraform should be used to managed Route53 zones and records.</span>
5. Some processes that are going to run inside these environments require between 100-250GB of data in memory 
    - Could you talk about a time when you needed to bring the data to the code, and how you architected this system?
    - If you don’t have an example, could you talk through how you would go about architecting this?
        - <span style="color:red">I am not familiar with the phrase bring the "data to the code". In the past I have supported Kinesis streams, Elasticache, and Confluent Kafka/KSqlDB. We had microservices deployed on EKS that communicated with these resources either as producers/consumers and leveraged VPCE to minimize egress traffic costs (Excluding Confluent resources as that was managed separately.). </span>
    - How would you monitor memory usage/errors? 
        - <span style="color:red">We can leverage CloudWatch to setup AWS native monitors</span>
### Troubleshooting 
Try to solve the problems that might arise through the test by yourself (we are always available, but we are looking forward to seeing your problem solving skills and ability to self serve).
