# openshift-static-web

Template for running a nginx container for a static website.

### Installation

You need oc (openshift cli tool) localy installed:

#### github private deploy key

create an ssh deploy key without passphrase
```sh
ssh-keygen -f ~joeri/.ssh/openshift-static-web
```

```sh
oc secrets new-sshauth openshift-static-web --ssh-privatekey=/home/joeri/.ssh/openshift
oc secrets add serviceaccount/builder secrets/openshift-static-web
```

Create the BuildConfig

```sh
$ oc create -f BuildConfig.yaml
```

Deploy from private git repository

```sh
$ oc new-app https://github.com/ure/openshift-static-web
```

#### route.yml

Routes to a static hostname

```sh
$ oc create -f route.yaml
```
#### WebHooks

You can find the (github and generic) webhook in the BuildConfig, you can find the webhook url in the openshift control pannel ! (handy for rolling updates)
