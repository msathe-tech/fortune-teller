<a href="https://push-to.cfapps.io?repo=https%3A%2F%2Fgithub.com%2Fmsathe-tech%2Ffortune-teller.git">
 	<img src="https://push-to.cfapps.io/ui/assets/images/Push-to-Pivotal-Light.svg" width="200" alt="Push">
</a>

## Or 

Build and deploy application on current 'cf target'

```
mvn clean package
./scripts/deploy.sh
```

## How to demo

### Show App Working
1. Access fortune-ui URL in browser and refresh page 
2. Go to apps manager, navigate to Hystrix dashboard 
3. Show service registry dashboard

### Demo Circuit breaker
1. stop fortune-service app
```$xslt
cf stop fortune-service
```
2. Access the fortune UI app and ensure it shows value from 'fallbackFortune' 

### Demo configuration service

1. Go to configuration/application.yml
2. Change the value of 'fallbackFortune' 
3. Access the fortune UI app and ensure it shows OLD value from 'fallbackFortune' 
4. Invoke actuator endpoint to force config change 
```$xslt
curl -X POST https://<Fortune UI app URL>/actuator/refresh
```
5. Access the fortune UI app and ensure it shows NEW value from 'fallbackFortune' 

### Clean up
```
./scripts/undeploy.sh
```