# Lab 3 - Implementing a Gateway

## What's changed?

### Spring Cloud Gateway Project
You will notice that there is a new module named `fortune-teller-gateway`. This is a Spring Cloud Gateway instance that routes traffice to either the `fortune-teller-ui` or the `fortune-teller-service`. For example, visiting the gateway's endpoint in a browser will redirect you to the ui's endpoint, and adding an `/api` path to the gateway's endpoint will redirect to the service's endpoint.

### Key Code
After examining the project structure, take a look at this code snippet from application.yml. You should notice the routes configured to redirect traffic to the correct components.

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

### Test redirection to the UI
1. Visit `https://$YOUR_GATEWAY_ENDPOINT`
1. Notice the redirect to `https://$YOUR_UI_ENDPOINT`

### Test redirection to the service
1. Visit `https://$YOUR_GATEWAY_ENDPOINT/api/random`
1. Notice the redirect to `https://$YOUR_SERVICE_ENDPOINT/api/random`

## Clean up

You can choose to clean up your environment, or keep it for the next lab.

```
./scripts/undeploy.sh
```
