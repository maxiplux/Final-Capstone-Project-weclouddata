#!/bin/bash
eksctl delete addon --cluster weclouddata  --name aws-ebs-csi-driver --preserve
eksctl delete cluster --region=us-east-1 --name=weclouddata --disable-nodegroup-eviction
