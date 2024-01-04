# DEPLOYMENT OF A BUDGET APP//Ruby app
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
  - [PostgreSQL StatefulSet Configuration (postgress.yaml)](#postgresql-statefulset-configuration-postgressyaml)
  - [Ruby App Service Configuration (load.yaml)](#ruby-app-load-configuration-loadyaml)
  - [Ruby App Deployment Configuration (rails.yaml)](#ruby-app-deployment-configuration-railsyaml)
- [TEKTON](#tekton)
  - [Tekton Configuration (pipeline.yaml)](#tekton-configuration-byaml)
  
- [ArgoCD](#argocd)
  - [ArgoCD Application Configuration (argocd.yaml)](#argocd-application-configuration-argocdyaml)
  - [ArgoCD Configurations (argocd-cm.yaml and argocd-rbac-cm.yaml)](#argocd-configurations-argocd-cmyaml-and-argocd-rbac-cmyaml)
- [Conclusion](#conclusion)

## Overview
### This repository contains configurations and resources for setting up a DevOps environment using Kubernetes, ArgoCD, Tekton, and Docker. Below are the detailed configurations and commands for each component

## DOCKER
#### This section contains the Docker configuration files for setting up a Ruby on Rails application with PostgreSQL using Docker Compose. The setup includes creating environment variables for PostgreSQL credentials, Dockerfiles for PostgreSQL and the Rails application, as well as a Docker Compose configuration to orchestrate the loads.

### Step 1: Creating Environment Variables for PostgreSQL
#### To create environment variables for PostgreSQL in the terminal, use the following command:
```
kubectl create secret generic postgres-credentials \
  --from-literal=POSTGRES_USER=your_username \
  --from-literal=POSTGRES_PASSWORD=your_password \
  --from-literal=POSTGRES_DB=your_database
```
##### (Replace your_username, your_password, and your_database with your actual PostgreSQL credentials.)
### Step 2: Dockerfiles
### PostgreSQL Dockerfile
#### The Dockerfile for PostgreSQL sets up a PostgreSQL 15 image and sets environment variables for PostgreSQL credentials.

### Ruby on Rails Dockerfile
#### The Dockerfile for the Ruby on Rails application sets up a Ruby 2.6 environment, installs dependencies including PostgreSQL client, Node.js, and Yarn, and copies the application files. It then precompiles assets and exposes port 3000 for the Rails server.

### Step 3: Docker Compose Configuration
#### The Docker Compose configuration (docker-compose.yml) defines two loads: rails for the Ruby on Rails application and postgress for PostgreSQL. It specifies the build context and Dockerfiles for both loads, exposes port 3000 for the rails load, and sets environment variables for the database URL in the rails load.
Building the Images

#### To build the Docker images, run the follbcommand:
```
docker-compose build
```
### Running the Docker Compose Configuration

#### To start the loads defined in the Docker Compose configuration, run the following command:
```
docker-compose up
```
This command will start the rails and postgress loads, making the Rails application available at http://localhost:3000.

## KUBERNETES
#### This section contains the Kubernetes configuration files for deploying and managing a Ruby on Rails application with PostgreSQL using Kubernetes resources. The setup includes defining resources such as StatefulSets, Services, Deployments, and Secrets to orchestrate the deployment and operation of thbication.

### PostgreSQL StatefulSet Configuration (postgres.yaml)
The postgress.yaml file contains the StatefulSet configuration for PostgreSQL. StatefulSet ensures stable, unique network identifiers, and persistent storage for PostgreSQL.

Apply the configuration:
```
kubectl apply -f postgres.yaml
```
### PostgreSQL Secret Configuration (load.yaml)
The load.yaml file contains the Kubernetes Secret configuration for PostgreSQL credentials.

Apply the configuration:
```
kubectl apply -f load.yaml
```
### Ruby App Deployment Configuration (rails.yaml)
The rails.yaml file contains the Kubernetes Deployment configuration for the Budget-app Ruby application.

Apply the configuration:
```
kubectl applybils.yaml
```

## TEKTON
#### This section contains the Tekton configurations for building and deploying applications using Tekton Pipelines.

### Tekton Pipeline Configuration (b.yaml)
The pipeline.yaml file contains the Tekton Pipeline configuration for the Budget-app project.

Apply the configuration:
```
kubectl apply -f b.yaml
```
## ArgoCD
#### This section contains the ArgoCD configurations for deploying and managing applications using GitOps principles with ArgoCD.
### ArgoCD Application Configuration (argocd.yaml)
The argocd-application.yaml file contains the ArgoCD Application configuration for the Budget-app project.

Apply the configuration:
```
kubectl apply -f argocd.yaml
```
### ArgoCD Configurations (argocd-cm.yaml and argocd-rbac-cm.yaml)
The argocd-cm.yaml and argocd-rbac-cm.yaml files contain the ConfigMap configurations for ArgoCD.

Apply the configurations:

```
kubectl apply -f argocd-cm.yaml
kubectl apply -f argocd-rbac-cm.yaml
```

### Conclusion
By following these instructions and applying the provided configurations, you can set up a robust DevOps environment using Docker, Kubernetes, ArgoCD, Tekton, and other tools. This environment enables efficient application deployment, management, and continuous integration and delivery (CI/CD) practices.
