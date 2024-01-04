# DEPLOYMENT OF A RUBY APP//Open-Flights
```

link to the live demo of the project--- https://drive.google.com/drive/folders/1zA85pcTQNx6dms6jq-T9izy1lZ2ThWDd?usp=drive_link

```

### Table of Contents
- [Overview](#overview)
- [DOCKER](#docker)
  - [Step 1: Creating Environment Variables for PostgreSQL](#step-1-creating-environment-variables-for-postgresql)
  - [Step 2: Dockerfiles](#step-2-dockerfiles)
  - [Step 3: Docker Compose Configuration](#step-3-docker-compose-configuration)
- [KUBERNETES](#kubernetes)
  - [PostgreSQL StatefulSet Configuration (db.yaml)](#postgresql-statefulset-configuration-dbyaml)
  - [PostgreSQL Secret Configuration (secret.yaml)](#postgresql-secret-configuration-secretyaml)
  - [Ruby App Service Configuration (service.yaml)](#ruby-app-service-configuration-serviceyaml)
  - [Ruby App Deployment Configuration (web.yaml)](#ruby-app-deployment-configuration-webyaml)
- [TEKTON](#tekton)
  - [Tekton Pipeline Configuration (pipeline.yaml)](#tekton-pipeline-configuration-pipelineyaml)
  - [Tekton Pipeline Resources Configuration (pipelineresources.yaml)](#tekton-pipeline-resources-configuration-pipelineresourcesyaml)
  - [Tekton PipelineRun Configuration (pipelinerun.yaml)](#tekton-pipelinerun-configuration-pipelinerunyaml)
  - [Tekton Task Configuration (task.yaml)](#tekton-task-configuration-taskyaml)
- [ArgoCD](#argocd)
  - [ArgoCD Application Configuration (argocd-application.yaml)](#argocd-application-configuration-argocd-applicationyaml)
  - [ArgoCD Configurations (argocd-cm.yaml and argocd-rbac-cm.yaml)](#argocd-configurations-argocd-cmyaml-and-argocd-rbac-cmyaml)
  - [ArgoCD Secret Configuration (argocd-secret.yaml)](#argocd-secret-configuration-argocd-secretyaml)
  - [Kubernetes Secret for Docker Authentication (docker-secret.yaml)](#kubernetes-secret-for-docker-authentication-docker-secretyaml)
- [Conclusion](#conclusion)

## Overview
### This repository contains configurations and resources for setting up a DevOps environment using Kubernetes, ArgoCD, Tekton, and Docker. Below are the detailed configurations and commands for each component

## DOCKER
#### This section contains the Docker configuration files for setting up a Ruby on Rails application with PostgreSQL using Docker Compose. The setup includes creating environment variables for PostgreSQL credentials, Dockerfiles for PostgreSQL and the Rails application, as well as a Docker Compose configuration to orchestrate the services.

## Step 1: Creating Environment Variables for PostgreSQL
### To create environment variables for PostgreSQL in the terminal, use the following command:
```
kubectl create secret generic postgres-credentials \
  --from-literal=POSTGRES_USER=your_username \
  --from-literal=POSTGRES_PASSWORD=your_password \
  --from-literal=POSTGRES_DB=your_database
```
#### (Replace your_username, your_password, and your_database with your actual PostgreSQL credentials.)
## Step 2: Dockerfiles
### PostgreSQL Dockerfile
### The Dockerfile for PostgreSQL sets up a PostgreSQL 15 image and sets environment variables for PostgreSQL credentials.

### Ruby on Rails Dockerfile
### The Dockerfile for the Ruby on Rails application sets up a Ruby 2.6 environment, installs dependencies including PostgreSQL client, Node.js, and Yarn, and copies the application files. It then precompiles assets and exposes port 3000 for the Rails server.

### Step 3: Docker Compose Configuration
### The Docker Compose configuration (docker-compose.yml) defines two services: web for the Ruby on Rails application and db for PostgreSQL. It specifies the build context and Dockerfiles for both services, exposes port 3000 for the web service, and sets environment variables for the database URL in the web service.
Building the Images

### To build the Docker images, run the following command:
```
docker-compose build
```
### Running the Docker Compose Configuration

### To start the services defined in the Docker Compose configuration, run the following command:
```
docker-compose up
```
This command will start the web and db services, making the Rails application available at http://localhost:3000.

## KUBERNETES
#### This section contains the Kubernetes configuration files for deploying and managing a Ruby on Rails application with PostgreSQL using Kubernetes resources. The setup includes defining resources such as StatefulSets, Services, Deployments, and Secrets to orchestrate the deployment and operation of the application.

### PostgreSQL StatefulSet Configuration (db.yaml)
The db.yaml file contains the StatefulSet configuration for PostgreSQL. StatefulSet ensures stable, unique network identifiers, and persistent storage for PostgreSQL.

Apply the configuration:
```
kubectl apply -f db.yaml
```
### PostgreSQL Secret Configuration (secret.yaml)
The secret.yaml file contains the Kubernetes Secret configuration for PostgreSQL credentials.

Apply the configuration:
```
kubectl apply -f secret.yaml
```
### Ruby App Service Configuration (service.yaml)
The service.yaml file contains the Kubernetes Service configuration for the Ruby application.

Apply the configuration:
```
kubectl apply -f service.yaml
```
### Ruby App Deployment Configuration (web.yaml)
The web.yaml file contains the Kubernetes Deployment configuration for the Ruby application.

Apply the configuration:
```
kubectl apply -f web.yaml
```

## TEKTON
#### This section contains the Tekton configurations for building and deploying applications using Tekton Pipelines.

### Tekton Pipeline Configuration (pipeline.yaml)
The pipeline.yaml file contains the Tekton Pipeline configuration for the Open Flights project.

Apply the configuration:
```
kubectl apply -f pipeline.yaml
```
# Tekton Pipeline Resources Configuration (pipelineresources.yaml)
The pipelineresources.yaml file contains the Tekton PipelineResource configuration for the Open Flights project.

Apply the configuration:
```
kubectl apply -f pipelineresources.yaml
```
### Tekton PipelineRun Configuration (pipelinerun.yaml)
The pipelinerun.yaml file contains the Tekton PipelineRun configuration for the Open Flights project.

Apply the configuration:
```
kubectl apply -f pipelinerun.yaml
```
### Tekton Task Configuration (task.yaml)
The task.yaml file contains the Tekton Task configuration for building and pushing Docker images.

Apply the configuration:
```
kubectl apply -f task.yaml
```
## ArgoCD
#### This section contains the ArgoCD configurations for deploying and managing applications using GitOps principles with ArgoCD.
### ArgoCD Application Configuration (argocd-application.yaml)
The argocd-application.yaml file contains the ArgoCD Application configuration for the Open Flights project.

Apply the configuration:
```
kubectl apply -f argocd-application.yaml
```
### ArgoCD Configurations (argocd-cm.yaml and argocd-rbac-cm.yaml)
The argocd-cm.yaml and argocd-rbac-cm.yaml files contain the ConfigMap configurations for ArgoCD.

Apply the configurations:

```
kubectl apply -f argocd-cm.yaml
kubectl apply -f argocd-rbac-cm.yaml
```
### ArgoCD Secret Configuration (argocd-secret.yaml)
The argocd-secret.yaml file contains the Secret configuration for GitHub credentials in ArgoCD.

Apply the configuration:
```
kubectl apply -f argocd-secret.yaml
```
### Kubernetes Secret for Docker Authentication (docker-secret.yaml)
The docker-secret.yaml file contains the Secret configuration for Docker authentication in Kubernetes.

### Apply the configuration:
```
kubectl apply -f docker-secret.yaml
```
### Conclusion
By following these instructions and applying the provided configurations, you can set up a robust DevOps environment using Docker, Kubernetes, ArgoCD, Tekton, and other tools. This environment enables efficient application deployment, management, and continuous integration and delivery (CI/CD) practices.
