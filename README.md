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
1. PCF prerequisites (explained in Lab0)

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
This workshop will progressively deploy the Fortune Teller microservices to achieve an ideal Cloud Native Application Architecture. Each application is contained in its own repository, as listed in the previous section. Each lab will iterate the growing application ecosystem, with details and instructions to guide the development and deployment practice.

The series of the Fortune Teller microservices are designed as shown below.

**TODO:INSERT BLOCK DIAGRAM**

## Labs

### Lab0 - Check requirements
This workshop requires a few additional requirements to successfully deploy to Pivotal Cloud Foundry.

1. Internet access OR access to a artifact repository to pull Spring and Pivotal dependencies
1. A Pivotal Application Service and access to the Marketplace
1. Spring Cloud Services, MySQL, and RabbitMQ in the Marketplace

Run the following script to ensure that your environment is ready. If not, you may need to resolve the issues as output by the script.

```
./check.sh
```

If your environment is prepared, you can move on to Lab1 - Create a Service.

### Lab1 - Create a Service
In Lab1, we will begin by creating a simple service application that consumes a MySQL backend, and is exposed with a REST layer.

The following diagram represents the target end state after completing Lab1.

To begin, clone the Fortune Service application.

```
git clone https://github.com/bernardpark/fortune-teller-service.git
```

Read through the instructions in the [Fortune Service repository](https://github.com/bernardpark/fortune-teller-service) and return here once completed to move on to lab2.

### Lab2 - Add an API Layer
### Lab3 - Add a UI
### Lab4 - Implement a Gateway
### Lab5 - Use CredHub and an external data backend

## Authors
* **Bernard Park** - [Github](https://github.com/bernardpark)
* **Madhav Sathe** - [Github](https://github.com/msathe-tech)
