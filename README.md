# ImaginePTS

## Introduction

This is the API layer of Amal's (Amal.Chaudhuri@bnymellon.com) Imagine Position Tracking System, packaged as a single Dockerfile.


#### Notes

Currently on Docker Hub as  https://hub.docker.com/r/johnw/imagini/


```
$ cf login –a api.cfaz1.bcferrycoder.com —skip-ssl-validation –u bxp –p inn0vate
$ cf push –k 2G imagini –docker-image johnw/imagini –c “/scripts/run-postgres-and-rails.sh”
  ```


### Misc notes

If ```df``` on container shows errors, try this:

```
# cp /proc/mounts /etc/mtab 
```

### Questions

* How to increase disk space on container on micropcf?

* How to ssh into azure cf container?  Works on Europe not East US.

* Install ruby w/out rvm? Works on ubuntu not on debian

* Why is there lag time after "docker push" until it shows up on hub?

* Why does johnw/bassh container have 310MB while i2 has only 60B?

* How to docker image push to CF from local docker registry?


### Ponder

* mount /dev/shm, make sure all ruby / rvm points there (so gems have diskspace)
* install postgres on ruby2.2 container


Here's the smallest cf docker app possible:

```
cf push ubuntu -o library/ubuntu -u none -c "nc -l 8080"
```

(still need nc though - need to ```apt-get install -y netsat``` on debian)

### CF NOTES

Endpoints:

* api.local.micropcf.io   # laptop
* api.40.114.222.50.xip.io  # Azure Europe West
* api.cfaz1.bcferrycoder.com  # Azure US East


After creating CF instance:

```  
$ cf enable-feature-flag diego_docker
$ cf create-user bxp
$ cf create-org bxpo
$ cf create-space -o bxpo bxps
$ cf set-org-role bxp bxpo OrgManager
$ cf set-space-role bxp bxpo bxps SpaceManager

```


