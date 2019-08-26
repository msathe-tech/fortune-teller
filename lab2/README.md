# Lab 2 - Adding a UI

## Overview
In this lab, you will add a UI application that consumes the fortune service, leveraging Spring Cloud Config, Spring Cloud Registry, and Spring Cloud Circuit Breaker.

## Spring Cloud Config
Examine the `FortuneProperties.java` class. You should notice the `@ConfigurationProperties` annotation. This tells Spring that this class will act as a properties object consuming your remote configuration. The annotation includes `prefix = "fortune"` that identifies the configuration prefix. The `@RefreshScope` annotation, as included by the Spring Actuator dependency, will force recreation of this bean when the actuator/refresh endpoint is called. This will pull in the latest configuration from your config server when changes are made. 
Be sure to note the `fortuneServiceURL` variable. Notice that it refers to the spring application naming convention, not an http/https url, we specify in our bootstrap.yml files, which is used to register application names in Service Registry.

## Spring Cloud Registry
Now take a look at `FortuneService.java`. The `randomFortune()` method, which is invoked in the method mapped to `/random` endpoint in `UiController.java`, makes a rest call to the `fortuneServiceURL` endpoint we saw earlier. By doing so, this application is referring to the binded Service Registry to call the service applciation.

## Spring Cloud Circuit Breaker
In the same `FortuneService.java` class, notice that the `randomFortune()` method is annotated with `@HystrixCommand( fallbackMethod = "fallbackFortune" )`. When this method fails, it falls back to the `fallbackFortune()` method below, to return a default response instead of an error code. This practice also helps implement a fail-fast methodology.

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

This deploy script does the following.
1. Build your applications with Maven
1. Create the necessary services on Pivotal Cloud Foundry
1. Push your applications

Examine the manifest.yml file to review the application deployment configurations and service bindings.

## Test the application

### Test the UI
1. Visit `https://$YOUR_UI_ENDPOINT`
1. Notice the UI in your browser
1. Notice the random fortune returned
1. Refresh the page
1. Notice another random fortune returned

### Test Circuit Breaker
1. Stop your service application (ex. `cf stop $YOUR_APP_SUFFIX-fortune-service`)
1. Refresh the UI
1. Notice the default fallback message

### Test Cloud Config
1. Make a change to you `configuration/application.yml` with a new fallback message
1. Refresh your application beans using the actuator endpoint (ex. `curl -k https://$YOUR_UI_ENDPOINT/actuator/refresh -X GET`)
1. Refresh the UI
1. Notice the changed default fallback message

## Clean up

You can choose to clean up your environment, or keep it for the next lab.

```
./scripts/undeploy.sh
```

## Authors
* **Bernard Park** - [Github](https://github.com/bernardpark)
* **Madhav Sathe** - [Github](https://github.com/msathe-tech)
