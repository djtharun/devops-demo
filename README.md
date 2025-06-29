DevOps Demo Project: Spring Boot, Maven, Docker, Kubernetes

This project serves as a practical demonstration for learning and implementing core DevOps concepts using a simple Java Spring Boot application, containerized with Docker, and deployed on Kubernetes.
🚀 Project Overview

The goal of this project is to showcase a complete, end-to-end pipeline from application development to deployment in a containerized environment.

Key Components:

    Spring Boot (Java): A simple RESTful web service that serves a "Hello, DevOps!" message and a basic web UI.

    Maven: Used for building the Spring Boot application, managing its dependencies, and packaging it into an executable JAR.

    Docker: Used to containerize the Spring Boot application, creating a portable image that can run consistently across different environments.

    Kubernetes: Used for orchestrating, deploying, and managing the Dockerized application as a scalable service.

✨ Features

    Simple Spring Boot web application.

    Maven-driven build process.

    Containerization using Docker.

    Deployment and exposure on a Kubernetes cluster.

    Basic web interface to interact with the backend API.

🛠️ Prerequisites

Before you begin, ensure you have the following software installed on your system:

    Java Development Kit (JDK) 17 or higher: For compiling and running the Spring Boot application.

        Download JDK

    Apache Maven: For building the Java project.

        Install Maven

    Docker Desktop (recommended for local Kubernetes): Includes Docker Engine and a built-in Kubernetes cluster.

        Download Docker Desktop

        Alternatively, if not using Docker Desktop's Kubernetes:

            Minikube: A tool that runs a single-node Kubernetes cluster locally.

                Install Minikube

            Kind: Another tool for running local Kubernetes clusters using Docker containers.

                Install Kind

    kubectl: The Kubernetes command-line tool for interacting with your cluster.

        Install kubectl

        If kubectl is not found after Minikube installation, you can alias it:

        # For Bash/Zsh
        alias kubectl="minikube kubectl --"
        # Then, source your shell profile, e.g., source ~/.bashrc or open a new terminal.

📂 Project Structure

The project follows a standard Maven and Kubernetes structure:

devops-demo/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/
│       │       └── example/
│       │           └── devops/
│       │               ├── DevopsDemoApplication.java  # Main Spring Boot application
│       │               └── HelloController.java        # REST endpoint and UI controller
│       └── resources/
│           └── static/
│               └── index.html                          # Web UI for interaction
├── kubernetes/
│   ├── deployment.yaml                               # Kubernetes Deployment definition
│   └── service.yaml                                  # Kubernetes Service definition
├── pom.xml                                           # Maven Project Object Model
└── Dockerfile                                        # Docker image build instructions

🚀 Setup and Run

Follow these steps to get your DevOps demo application up and running on Kubernetes.
1. Build the Spring Boot Application with Maven

Navigate to the root of your devops-demo project directory in your terminal and execute the Maven build:

cd devops-demo
mvn clean package

This command compiles your Java code, runs tests, and packages the application (including index.html) into an executable JAR file located in the target/ directory.
2. Build the Docker Image

Ensure your Docker daemon is running (e.g., Docker Desktop is open). Then, build the Docker image from the project root:

docker build -t devops-demo:latest .

This creates a Docker image tagged devops-demo:latest that contains your Spring Boot application.
3. Start Your Local Kubernetes Cluster

If you're using Docker Desktop, ensure Kubernetes is enabled in its settings. If you're using Minikube or Kind:

    Minikube:

    minikube start

    If you built the Docker image outside of Minikube's daemon, load it:

    eval $(minikube docker-env)
    docker build --no-cache -t devops-demo:latest . # Re-build directly into Minikube's Docker daemon

    Kind:

    kind create cluster

Verify your kubectl context is set to your local cluster:

kubectl config current-context

4. Deploy to Kubernetes

Apply the Kubernetes deployment and service definitions located in the kubernetes/ directory. Make sure you are in the devops-demo root directory.

kubectl apply -f kubernetes/deployment.yaml
kubectl apply -f kubernetes/service.yaml

Monitor the deployment status:

kubectl get deployments
kubectl get pods
kubectl get services

Wait until your devops-demo-deployment pods are in a Running state.
5. Access the Application

The application is exposed via a NodePort service on port 30080.

    For Docker Desktop Kubernetes:
    Open your web browser and navigate to:

    http://localhost:30080/

    For Minikube:
    First, get the IP address of your Minikube cluster:

    minikube ip

    Then, open your web browser and navigate to:

    http://<MINIKUBE_IP>:30080/
    # Replace <MINIKUBE_IP> with the IP address obtained from 'minikube ip'
    # Example: http://192.168.49.2:30080/

You should see the web UI with a button. Click the "Call Hello API" button to see the response from your Spring Boot backend.
🧹 Clean Up

To remove the deployed resources from your Kubernetes cluster (this does not delete your local .yaml files or project directory):

kubectl delete -f kubernetes/deployment.yaml
kubectl delete -f kubernetes/service.yaml

To stop your local Kubernetes cluster:

    Minikube:

    minikube stop

    Kind:

    kind delete cluster

🔄 Updating the Application

If you make changes to your Java code (.java files) or the index.html:

    Rebuild JAR: mvn clean package

    Rebuild Docker Image: docker build -t devops-demo:latest .

    (Minikube only) Reload Image: eval $(minikube docker-env) && docker build --no-cache -t devops-demo:latest .

    Re-apply Kubernetes Deployment: kubectl apply -f kubernetes/deployment.yaml (Kubernetes will perform a rolling update.)

🤝 Contributing to GitHub

Once your project is working locally, you can push it to a GitHub repository to share or collaborate.

    Create a New GitHub Repository: Go to GitHub and create a new, empty repository (e.g., devops-demo-project). Do not initialize it with a README or license.

    Initialize Git Locally:
    Navigate to your devops-demo project directory in the terminal.

    git init

    Add Files and Commit:

    git add .
    git commit -m "Initial commit: Spring Boot, Maven, Docker, Kubernetes demo"

    Link to Remote Repository:
    Replace <your-username> and <repository-name> with your actual GitHub details.

    git remote add origin https://github.com/<your-username>/<repository-name>.git

    Push to GitHub:

    git push -u origin main # Or 'master', depending on your default branch name

Your project will now be available on GitHub!
