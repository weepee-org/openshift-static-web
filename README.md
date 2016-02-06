# openshift-static-web

Template for running a apache on a container based on alpine linux/openshift/docker.

### Installation

You need oc (https://github.com/openshift/origin/releases) locally installed:

create a new project (change to your whishes) or add this to your existing project

```sh
oc new-project openshift-apache \
    --description="WebServer - Apache" \
    --display-name="Apache"
```

Deploy

```sh
oc new-app https://github.com/ure/openshift-static-web.git -n static-webserver
```

#### Route.yml

Create route for development and testing

```sh
curl https://raw.githubusercontent.com/ure/openshift-static-web/master/Route.yaml | oc create -f -
```
