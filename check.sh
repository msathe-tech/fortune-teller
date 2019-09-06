#!/usr/bin/env bash
#******************************************************************************
#    Check Prerequisites
#******************************************************************************
#
# DESCRIPTION
#    Checks your PCF environment for workshop prerequisites
#
#
#==============================================================================
#
#==============================================================================

echo "*********************************************************************************************************"

# Vars
EXITCODE=1

# Resolve Dependencies
if [ ! -z "`\./mvnw clean dependency:resolve -f pom1.xml | grep "BUILD SUCCESS"`" ]; then
  echo "Dependency resolution for pom1.xml was successful"
else
  echo "[ERROR] Dependency resolution for pom1.xml failed. Rerun \"./mvnw clean dependency:resolve -f pom1.xml\" for details."
  EXITCODE=0
fi

if [ ! -z "`\./mvnw clean dependency:resolve -f pom2.xml | grep "BUILD SUCCESS"`" ]; then
  echo "Dependency resolution for pom2.xml was successful"
else
  echo "[ERROR] Dependency resolution for pom2.xml failed. Rerun \"./mvnw clean dependency:resolve -f pom1.xml\" for details."
  EXITCODE=0
fi

# Check Marketplace
cf m > marketplace.txt

if [ ! -z "`cat marketplace.txt | grep "p\.mysql"`" ]; then
  echo "Found p.mysql"
elif [ ! -z "`cat marketplace.txt | grep "p-mysql"`" ]; then
  echo "Found p-mysql"
else
  echo "[ERROR] Could not find the MySQL tile." 
  EXITCODE=0
fi
if [ ! -z "`cat marketplace.txt | grep "p\.config-server"`" ]; then
  echo "Found p.config-server"
elif [ ! -z "`cat marketplace.txt | grep "p-config-server"`" ]; then
  echo "Found p-config-server"
else
  echo "[ERROR] Could not find the Config Server tile." 
  EXITCODE=0
fi
if [ ! -z "`cat marketplace.txt | grep "p\.service-registry"`" ]; then
  echo "Found p.service-registry"
elif [ ! -z "`cat marketplace.txt | grep "p-service-registry"`" ]; then
  echo "Found p-service-registry"
else
  echo "[ERROR] Could not find the Service Registry tile." 
  EXITCODE=0
fi
if [ ! -z "`cat marketplace.txt | grep "p\.circuit-breaker-dashboard"`" ]; then
  echo "Found p.circuit-breaker-dashboard"
elif [ ! -z "`cat marketplace.txt | grep "p-circuit-breaker-dashboard"`" ]; then
  echo "Found p-circuit-breaker-dashboard"
else
  echo "[ERROR] Could not find the Circuit Breaker Dashboard tile."
  EXITCODE=0
fi
if [ ! -z "`cat marketplace.txt | grep "p\.rabbitmq"`" ]; then
  echo "Found p.rabbitmq"
elif [ ! -z "`cat marketplace.txt | grep "p-rabbitmq"`" ]; then
  echo "Found p-rabbitmq"
else
  echo "[ERROR] Could not find the RabbitMQ tile."
  EXITCODE=0
fi
if [ ! -z "`cat marketplace.txt | grep "credhub"`" ]; then
  echo "Found credhub"
else
  echo "[ERROR] Could not find the CredHub tile."
  EXITCODE=0
fi

if [[ $EXITCODE == "0" ]]; then
  echo "There were issues with your environment. Make sure you resolve the errors listed above."
else
  echo "Your environment is ready for the workshop"
fi

echo "*********************************************************************************************************"

rm marketplace.txt
exit $EXITCODE
