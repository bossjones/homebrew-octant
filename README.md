# homebrew-octant

Custom tap of octant w/ fixes for vmware fusion

[![Build Status](http://img.shields.io/travis/bossjones/homebrew-octant.svg?style=flat)](https://travis-ci.org/bossjones/homebrew-octant)

[Homebrew](http://brew.sh/) forked [tap](https://github.com/Homebrew/homebrew/wiki/brew-tap) for [octant](https://github.com/Homebrew/homebrew-core/blob/master/Formula/octant.rb). Changes can be seen here: [weikinhuang/octant](https://github.com/weikinhuang/octant/tree/vmware-driver)


## Usage

Add the Homebrew tap:

```bash
$ brew tap bossjones/homebrew-octant
```

You'll see some warnings as these formulae conflict with those in the main reponitory, but that's fine.

Install the libraries:

```bash
$ brew install bossjones/homebrew-octant/homebrew-octant
```

You can test it using the following:

```bash
$ octant <DOCKER-MACHINE NAME>
```

### Re-installing

To re-install, uninstall before following the instructions above:

```bash
$ brew uninstall bossjones/homebrew-octant/homebrew-octant
```


## Thank You

Thank you [adlogix](https://github.com/adlogix) for writing this shell script to help people w/ their local docker development environments. Thank you to [LiliC/travis-minikube](https://github.com/LiliC/travis-minikube) as well.

## References

* https://github.com/adlogix/octant
* https://github.com/weikinhuang/octant/tree/vmware-driver


# CI

[![Build Status](https://travis-ci.org/bossjones/homebrew-octant.svg?branch=master)](https://travis-ci.org/bossjones/homebrew-octant)

### travis x minikube

Quick example of running [minikube](https://github.com/kubernetes/minikube) on [Travis CI](https://travis-ci.org/) with [Kubernetes](https://github.com/kubernetes/kubernetes) version `1.15.0`.
To read more in detail check out my [guest blog post](https://blog.travis-ci.com/2017-10-26-running-kubernetes-on-travis-ci-with-minikube) on the Travis CI blog.

To switch Kubernetes cluster versions just replace the `1.15.0` version in the `.travis.yml` file.

Note that [RBAC](https://kubernetes.io/docs/reference/access-authn-authz/rbac/) is not enabled on this cluster by default. To enable RBAC, you need to start minikube with the `--extra-config=apiserver.authorization-mode=RBAC` flag.
Starting Minikube with RBAC enabled requires the appropriate RBAC roles to be created in the `kube-system` namespace, so all components work as expected. One of the possible solutions is to give the `default` ServiceAccount in the `kube-system` namespace the `cluster-admin` permissions. For more details see the [issue #1722](https://github.com/kubernetes/minikube/issues/1722).
