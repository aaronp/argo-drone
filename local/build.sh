#!/usr/bin/env bash

function install() {
    # get kind
    which kind || (echo "installing kind" && brew install kind)

    # get or create a cluster
    if kind get clusters 2> /dev/null | grep -q 'local-cluster'; then
      echo "local-cluster already exists"
    else 
      echo "creating cluster"
      kind create cluster --name local-cluster
      kubectl cluster-info --context kind-local-cluster
    fi

    # and ... not really just for local clusters, but...
    which k9s || (echo "installing k9s" && brew install k9s)
}