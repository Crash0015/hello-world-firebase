Hello World on Firebase (Serverless Hosting)

This project demonstrates a fully automated CI/CD pipeline for deploying a static application to Firebase Hosting. Firebase offers a modern, Serverless approach to hosting, contrasting with the Infrastructure-as-a-Service (IaaS) model used by AWS EC2.

The primary goal of this repository is to meet two requirements of the assignment simultaneously:

Deployment: Deploy the live site to Firebase Hosting.

Docker Mandate: Build and push a corresponding Docker image to Docker Hub, fulfilling the containerization requirement of the rubric.

👥 Team Members

Cristian Pilapanta

Dylan Paez

Rommel Pachacama

Andres Caluguillin

🚀 URL Demo

The application is deployed on Google's global network and is publicly accessible via the Firebase domain.

Public URL: https://hello-world-firebase-640c3.web.app

Technology Stack

Cloud Provider: Firebase (Google)

Service Model: PaaS / Serverless Hosting

Hosting Service: Firebase Hosting

CI/CD: GitHub Actions

Containerization (Mandatory): Docker (Nginx image pushed to Docker Hub)

Automated CI/CD Pipeline

This project is automated. Any change pushed to the main branch triggers the two-part workflow defined in .github/workflows/deploy.yml.

Job 1: build-and-push-dockerhub (Docker Mandate)

This job fulfills the containerization requirement, proving the application can run in a container environment, even though Firebase Hosting does not use it.

Logs into Docker Hub using secrets.

Builds the Dockerfile (an Nginx server image).

Pushes the new image to the team's Docker Hub registry.

Job 2: deploy-to-firebase (Live Deployment)

This job handles the actual deployment of the static files (HTML, CSS, JS) to the live site.

Uses the official action-hosting-deploy action.

Authenticates using the Firebase Service Account (FIREBASE_SERVICE_ACCOUNT secret).

Deploys the static files directly to the live production channel.

Docker Image Details (Criterio 4)

Although the deployment is Serverless, the working Docker image is available for local testing or IaaS deployment.

Image Name: cristianp970/hello-world-firebase:latest

Run Locally:

docker pull cristianp970/hello-world-firebase:latest
docker run -d -p 8080:80 --name hello-firebase-local cristianp970/hello-world-firebase:latest

View the project at http://localhost:8080.

How to Replicate this Setup

To successfully deploy a project to this Firebase account via GitHub Actions:

Fork this repository.

Create Firebase Project: Must have the Project ID hello-world-firebase-640c3 (or update .firebaserc and .github/workflows/deploy.yml).

Generate Service Account Key: In the Firebase Console, generate a private key file (.json) for programmatic access.

Create Repository Secrets: Add the following three secrets to your forked repository:

DOCKERHUB_USERNAME

DOCKERHUB_TOKEN

FIREBASE_SERVICE_ACCOUNT: The full content of the generated .json key file.
