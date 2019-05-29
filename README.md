<a href="https://push-to.cfapps.io?repo=https%3A%2F%2Fgithub.com%2Fmsathe-tech%2Ffortune-teller.git">
 	<img src="https://push-to.cfapps.io/ui/assets/images/Push-to-Pivotal-Light.svg" width="200" alt="Push">
</a>

## Or 

Build and deploy application on current 'cf target'

```
mvn clean package
./scripts/deploy.sh
```

Demo Circuit breaker
```$xslt
cf stop fortune-service
```

Access the fortune UI app and ensure it shows value from 'fallbackFortune' 

Demo configuration service

Go to configuration/application.yml
Change the value of 'fallbackFortune' 

Access the fortune UI app and ensure it shows OLD value from 'fallbackFortune' 
```$xslt
curl -X POST https://<Fortune UI app URL>/actuator/refresh
```
Access the fortune UI app and ensure it shows NEW value from 'fallbackFortune' 

Clean up
```
./scripts/undeploy.sh
```