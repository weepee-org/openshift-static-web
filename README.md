# openshift-static-web

Template for running a nginx container for a static website.

### Installation

You need oc (openshift cli tool) localy installed:

```sh
$ oc new-app https://github.com/ure/openshift-static-web
```

#### route.yml

Routes to a static hostname

```sh
$ oc create -f route.yaml
```
