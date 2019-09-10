# Cloud Native Application Development Workshop

This repository is a collection of progressive hands-on labs that will guide you through building a cloud native application with Spring on Pivotal Cloud Foundry. The workshop will use the following components:

1. Spring Data JPA
1. Spring Cloud Web
1. Spring Cloud Config
1. Spring Cloud Service Registry
1. Spring Cloud Gateway
1. Spring Cloud Circuit Breaker
1. CredHub

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
1. An external Database (accessible through the Internet, i.e. an RDS or GCP SQL instance)
1. Maven 

# Architecture

This workshop will progressively deploy the Fortune Teller microservices to achieve an ideal Cloud Native Application Architecture. Each application is contained in its own repository, as listed in the previous section. Each lab will iterate the growing application ecosystem, with details and instructions to guide the development and deployment practice.

The series of the Fortune Teller microservices are designed as shown below.

**TODO:INSERT BLOCK DIAGRAM**

# Labs

## Lab0 - Check requirements

This workshop requires a few additional requirements to successfully deploy to Pivotal Cloud Foundry.

1. Internet access OR access to a artifact repository to pull Spring and Pivotal dependencies
1. A Pivotal Application Service and access to the Marketplace
1. Spring Cloud Services, MySQL, and RabbitMQ in the Marketplace


First, make sure you have logged into your target PCF foundation.

Run the following script to ensure that your environment is ready. If not, you may need to resolve the issues as output by the script.

```
./check.sh
```

If your environment is prepared, you can move on to Lab1 - Create a Service.

## Lab1 Create a Service

In Lab1, we will begin by creating a simple service application that consumes a MySQL backend, and is exposed with a REST layer.

The following diagram represents the target end state after completing Lab1.

**TODO:INSERT BLOCK DIAGRAM**

To begin, clone the Fortune Service application and switch to the `master_lab` branch.

```
git clone https://github.com/bernardpark/fortune-teller-service.git
git checkout -b master_lab
git pull origin master_lab
```

Read through the instructions in the [Fortune Service repository](https://github.com/bernardpark/fortune-teller-service/tree/master_lab) and return here once completed to move on to lab2.

## Lab2 Create a Configuration Repository

In Lab1, we will begin by creating a simple configuration repository. Fork the provided Git repository, or gain access to a separate repository. Any Git repository will work with these series of labs as long as the property keys are named the same. Make sure your properties look like this, **with the last couple URLs matching your API and UI endpoints (which will be deployed in labs 3 and 4).**

```
api:
  fallbackFortune: "API is not responding."
  apiURL: //fortune-api
service:
  fallbackFortune: "Your future is bright. Enjoy!"
  serviceURL: //fortune-service
url:
  apiURL: http://fortune-api.apps.run.pivotal.io
  uiURL: http://fortune-ui.apps.run.pivotal.io
```

Once completed, move on to lab3.

## Lab3 Add an API Layer

In Lab3, we will add an API in front of the service application that will act as the backend-for-frontend for subsequent consumers.

The following diagram represents the target end state after completing Lab3.

**TODO:INSERT BLOCK DIAGRAM**

To begin, clone the Fortune API application and switch to the `master_lab` branch.

```
git clone https://github.com/bernardpark/fortune-teller-api.git
git checkout -b master_lab
git pull origin master_lab
```

Read through the instructions in the [Fortune API repository](https://github.com/bernardpark/fortune-teller-api/tree/master_lab) and return here once completed to move on to lab4.

## Lab4 Add a UI

In Lab4, we will deploy a frontend UI, which will be a consumer of the Fortune Service application through the Fortune API.

The following diagram represents the target end state after completing Lab4.

**TODO:INSERT BLOCK DIAGRAM**

To begin, clone the Fortune UI application and switch to the `master_lab` branch.

```
git clone https://github.com/bernardpark/fortune-teller-ui.git
git checkout -b master_lab
git pull origin master_lab
```  

Read through the instructions in the [Fortune UI repository](https://github.com/bernardpark/fortune-teller-ui/tree/master_lab) and return here once completed to move on to lab4.

## Lab5 Implement a Gateway

In Lab5, we will add a gateway application as the single point of entry into our microservice ecosystem. It will route traffic as necessary to its underlying components.

The following diagram represents the target end state after completing Lab5.

**TODO:INSERT BLOCK DIAGRAM**

To begin, clone the Fortune Gateway application and switch to the `master_lab` branch.

```
git clone https://github.com/bernardpark/fortune-teller-gateway.git
git checkout -b master_lab
git pull origin master_lab
```  

Read through the instructions in the [Fortune Gateway repository](https://github.com/bernardpark/fortune-teller-gateway/tree/master_lab) and return here once completed to move on to lab6.

## Lab6 Use CredHub and an external data backend

In Lab6, we will redeploy a newer version of the Fortune Service application so that it consumes an external database backend. It will leverage Credhub to encrypt and manage external connection details.

The following diagram represents the target end state after completing Lab6.

**TODO:INSERT BLOCK DIAGRAM**

To begin, change directories into the cloned Fortune Service and switch to the `credhub_lab` branch.

```
cd $WORKSHOP_DIR/fortune-teller-service
git checkout -b credhub_lab
git pull origin credhub_lab
```  

Read through the instructions in the [Fortune Service repository credhub branch](https://github.com/bernardpark/fortune-teller-service/tree/credhub_lab) and return here once completed to move on to lab7.

## Lab7 Configure AutoScaling
**TODO: Add Lab7 here**


## Authors
* **Bernard Park** - [Github](https://github.com/bernardpark)
* **Madhav Sathe** - [Github](https://github.com/msathe-tech)
