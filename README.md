# Cloud Native Application Development Workshop

This repository is a collection of progressive hands-on labs that will guide you through building a cloud native application with Spring on Pivotal Cloud Foundry. The workshop will use the following components:

1. Spring Data JPA
1. Spring Cloud Web
1. Spring Cloud Config
1. Spring Cloud Service Registry
1. Spring Cloud Gateway
1. Spring Cloud Circuit Breaker

## Fortune Teller

The Fortune Teller app is a series of microservice applications that returns a random fortunes. Each microservice is contained in its own Git repository. You can view each of them with the following links.

* [Fortune Service](https://github.com/bernardpark/fortune-teller-service)
* [Fortune API](https://github.com/bernardpark/fortune-teller-api)
* [Fortune UI](https://github.com/bernardpark/fortune-teller-ui)
* [Fortune Gateway](https://github.com/bernardpark/fortune-teller-gateway)
* [Fortune Config](https://github.com/bernardpark/fortune-teller-config)

## Prerequisites

Ensure that you have the following

1. JDK 1.8.x
1. cf CLI 6.40.x+
1. An IDE of your choice (i.e. Spring Tool Suite, Eclipse, IDEa)

## Getting Started

Clone all repositories to an environment of your choice

```bash
git clone https://github.com/bernardpark/fortune-teller-service.git
git clone https://github.com/bernardpark/fortune-teller-api.git
git clone https://github.com/bernardpark/fortune-teller-ui.git
git clone https://github.com/bernardpark/fortune-teller-gateway.git
git clone https://github.com/bernardpark/fortune-teller-ui.git
```

# Workshop

## Architecture
The series of Fortune Teller microservices are designed as shown below.

**TODO:INSERT BLOCK DIAGRAM**

## Labs
### Lab1 - Create a Service
### Lab2 - Add an API Layer
### Lab3 - Add a UI
### Lab4 - Implement a Gateway
### Lab5 - Use CredHub and an external data backend

## Authors
* **Bernard Park** - [Github](https://github.com/bernardpark)
* **Madhav Sathe** - [Github](https://github.com/msathe-tech)
