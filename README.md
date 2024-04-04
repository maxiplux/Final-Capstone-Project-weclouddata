
![Micro Services Calculator Architecture](aws-spring-netflix.png)

# Spring Boot Cloud Netflix on Kubernetes Architecture

This document outlines the architecture of a microservices-based system utilizing Spring Boot Cloud Netflix components, deployed on Kubernetes (K8S). The system is designed for high availability, scalability, and robust service discovery and monitoring.

## Architecture Overview

The system is structured into several components, each running within the AWS cloud environment and orchestrated by Kubernetes.

### Infrastructure Setup

- **Terraform**: Used for infrastructure as code to provision the AWS resources.
- **AWS EC2 Jenkins**: An AWS EC2 instance is set up to run Jenkins for continuous integration and delivery (CI/CD) pipelines.

### Kubernetes (K8S)

- **AWS-KUBERNETES**: The Kubernetes cluster hosted on AWS, used to manage and scale the microservices.

### Microservices

- **NAMESPACE WE-CLOUD-DATA**:
  - **MICROSERVICE-1**: A Spring Boot Java application responsible for addition and subtraction operations. It runs on port `8081`.
  - **MICROSERVICE-2**: Another Spring Boot Java application that handles multiplication and division operations, running on port `8082`.

### API Gateway

- **SPRING-CLOUD-API-GATEWAY**: Acts as the entry point for all the microservices. It is responsible for request routing, composition, and protocol translation. It is accessible on port `8075`.

### Service Discovery

- **SPRING-EUREKA-SERVER**: Provides service discovery to register and locate microservices within the ecosystem. It helps in load balancing and failover of services. The Eureka server is accessible on port `8045`.

### Monitoring and Observability

- **NAMESPACE ISTIO**:
  - **PROMETHEUS**: An open-source monitoring solution that collects and stores metrics as time series data. It is running on port `8082`.
  - **GRAFANA**: A multi-platform open-source analytics and interactive visualization web application. It provides charts, graphs, and alerts for the web when connected to supported data sources, running on port `3000`.
  - **LOKI**: A horizontally-scalable, highly-available, multi-tenant log aggregation system inspired by Prometheus. It is accessible on port `3100`.

### User Interaction

- **Chrome**: The user interacts with the system through a browser, likely Chrome, sending requests to the Spring Cloud API Gateway.

## Workflow

1. The user sends a request via Chrome to the Spring Cloud API Gateway.
2. The API Gateway forwards the request to the appropriate microservice in the WE-CLOUD-DATA namespace based on the request path.
3. The microservices perform their respective operations and send back the response through the API Gateway.
4. Jenkins automates the deployment of microservices, leveraging the infrastructure created by Terraform.
5. The Eureka server manages service discovery, while Prometheus, Grafana, and Loki provide monitoring and logging.

## Conclusion

This architecture is designed to be resilient and flexible, enabling quick scaling and easy maintenance of the microservices. Monitoring tools ensure the health of the system is continuously observed, allowing for proactive management of the system's operations.

