# Online Boutique Deployment Automation

Executing this script will automatically deploy [Google's Online Boutique microservice demo](https://github.com/GoogleCloudPlatform/microservices-demo/tree/main) to a K8s cluster, which I am sharing with you.
To deploy it, simply follow these steps:
- Create a Nova/AWS EC2 instance with Ubuntu operating system and instance type at least m5.xlarge (4 cores are needed)
- SSH into the instance, create an .sh file, copy the contents of the attached script to it, and make it executable with `chmod +x <filename>.sh`
- Execute the script with `./<filename>.sh` This step might take up to 30 mins.
- Once finished you have a running k8s cluster, with which you can interact with kubeclt. The cluster also deploys simulated loads.
- If you want to access the front-end of the app yourself, on your local machine create a tunnel like so: `ssh -L 8080:localhost:8080 <user>@<remote-server-ip>`, and once connected you can run `kubectl port-forward deployment/frontend 8080:8080`. This makes the frontend available in a browser on localhost:8080 (screenshot of the main page attached).

Now you can try to (auto-)instrumenting the application and try to get some metrics, traces and logs to Splunk Observability Cloud.
Happy observing! In case you encounter any problems, let me know! 