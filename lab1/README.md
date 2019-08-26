# Lab 1 - Creating a Service

## Overview
In this lab, you will deploy a simple service application. This will be a single Java application, with a REST API layer and a MySQL backend.

## Spring MVC / Spring Data JPA
Take a look at the project structure. The spring-boot-starter-web dependency will provide Spring MVC to build out your API layer, and the spring-boot-starter-data-jpa will provide the boilerplate configuration for JPA/Hibernate. In src/main/resources/application.yml, you can notice that Hibernate's SQL dialect is chosen for MySQL, and that the spring.jpa.hibernate.ddl-auto flag is set to `create-drop`. This will execute your `import.sql` file upon application startup to inject initial data.

## Config Client
In addition to the Spring dependencies, you can also notice spring-cloud-services-starter-config-client. This will allow your application to consume configuration from your remote Spring Cloud Config Server service instance in Pivotal Cloud Foundry. This service instance will be configured to read configuration from the configuration/application.yml file in the root directory of this repository.

## Service Registry
By including spring-cloud-services-starter-service-registry, your application will now be registered in your Service Registry service instance in Pivotal Cloud Foundry.

Take a look at src/main/resources/bootstrap.yml as well. This properties file, to be read before your application.yml file, define
s the name of this application when it is registered in your Service Registry. In the future, you may build out your microservices to reference each service by its registered name.

## Deploying the Application
<a href="https://push-to.cfapps.io?repo=https%3A%2F%2Fgithub.com%2Fmsathe-tech%2Ffortune-teller.git">
        <img src="https://push-to.cfapps.io/ui/assets/images/Push-to-Pivotal-Light.svg" width="200" alt="Push">
</a>

### Or

Build and deploy application on current 'cf target'

```
./deploy.sh
```
When prompted for the App Suffix, give a unique identifier. This is to ensure that there is no overlap in cf application names whe
n pushing.

## Test the application

### Test the service
1. Visit `https://$YOUR_SERVICE_ENDPOINT/random`.
1. Notice a random fortune returned.

## Clean up

You can choose to clean up your environment, or keep it for the next lab.

```
./scripts/undeploy.sh
```

## Authors
* **Bernard Park** - [Github](https://github.com/bernardpark)
* **Madhav Sathe** - [Github](https://github.com/msathe-tech)
