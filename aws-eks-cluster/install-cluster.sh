#!/bin/bash
eksctl create  cluster -f cluster.yaml
eksctl utils associate-iam-oidc-provider --cluster=weclouddata --region us-east-1 --approve
eksctl create addon --name aws-ebs-csi-driver --cluster weclouddata --service-account-role-arn arn:aws:iam::$(aws sts get-caller-identity --query Account --output text):role/AmazonEKS_EBS_CSI_DriverRole --force

#aws eks update-kubeconfig   --region us-east-1 --name weclouddata
#eksctl get iamidentitymapping --cluster weclouddata --region us-east-1
#pip3 install awscli --upgrade --user

