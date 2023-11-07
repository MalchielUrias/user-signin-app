# AWS-AUTH Config Map
In order to gain access into the cluster, your user must be part of a group that has access to the cluster.

When you create an Amazon EKS cluster, the IAM principal that creates the cluster is automatically granted system:masters permissions in the cluster's role-based access control (RBAC) configuration in the Amazon EKS control plane. This principal doesn't appear in any visible configuration, so make sure to keep track of which principal originally created the cluster. To grant additional IAM principals the ability to interact with your cluster, edit the aws-auth ConfigMap within Kubernetes and create a Kubernetes rolebinding or clusterrolebinding with the name of a group that you specify in the aws-auth ConfigMap.

To access the cluster with a different user, you must add that user and grant RBAC access using the aws-auth configmap in the kube-system namespace

## Granting access 

1. First, you must add a new context for this new cluster you created to your kubeconfig file so that kubectl can run commands on it

aws eks update-kubeconfig --name mycluster-name --kubeconfig mykubeconfig-name --region myregion-name

2. Next, we would view and inspect the present aws-auth file for our cluster using kubectl

kubectl get configmap -n kube-system aws-auth -o yaml --kubeconfig=path-to/kubeconfig

3. We would then create a new group and a new cluster rolebinding

kubectl create clusterrolebinding my-cluster-rolebinding-name \
--clusterrole=cluster-admin \
--group=mygroup-name \
--kubeconfig=mykubeconfig-name

4. Edit aws-auth configmap

kubectl edit configmaps -n kube-system aws-auth -o yaml --kubeconfig=mykubeconfig-name

5. Add the following code block to the mapRoles section of the aws-auth configmap

- groups:
  - mygroup-name 
  rolearn: my-ARN

6. Confirm changes 

kubectl get configmap aws-auth -n kube-system -o yaml --kubeconfig=mykubeconfig-name

## Code