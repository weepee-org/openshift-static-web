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

Deploy (externally)

```sh
oc new-app https://github.com/weepee-org/openshift-static-web.git --name static-webserver
```

Deploy (weepee internally)
add to Your buildconfig
```yaml
spec:
  strategy:
    dockerStrategy:
      from:
        kind: ImageStreamTag
        name: static-webserver:latest
        namespace: weepee-registry
    type: Docker
```
use in your Dockerfile
```sh
FROM weepee-registry/static-webserver

# Your app
ADD app /app
```

#### Route.yml

Create route for development and testing

```sh
curl https://raw.githubusercontent.com/ure/openshift-static-web/master/Route.yaml | oc create -f -
```
