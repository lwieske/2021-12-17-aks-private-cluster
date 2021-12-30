---
marp: true
---

<!-- _class: invert -->

## Azure AKS

* Azure Kubernetes Service (AKS) offers serverless Kubernetes, an integrated
  continuous integration and continuous delivery (CI/CD) experience, and
  enterprise-grade security and governance.

* AKS allos to deploy and manage containerized applications more easily with a
  fully managed Kubernetes service.

* AKS gives a means unite your development and operations teams on a single
  platform to rapidly build, deliver, and scale applications with confidence.

---

## AKS Private Cluster

* A Standard Azure Kubernetes Service cluster has a public IP address for the
  API Server.

* A Private AKS cluster has a private IP address for its API server endpoint.

* In both the Standard AKS Cluster and the Private AKS cluster the Worker Nodes
  have a Private IP address.

---

![](https://spltech.co.uk/wp-content/uploads/2021/08/image.png)

---

## AKS Private Cluster Access

* Accessing a private AKS cluster requires that you connect to that cluster
  either from the cluster virtual network or from a peered network. These
  approaches require configuring a VPN, Express Route, or deploying a jumpbox
  within the cluster virtual network.

---

<!-- _class: invert -->

## AKS Private Cluster Access (II)

* Alternatively, you can use command invoke to access private clusters without
  having to configure a VPN or Express Route.

  * Using command invoke allows you to remotely invoke commands like kubectl and
    helm on your private cluster through the Azure API without directly
    connecting to the cluster.

  * Permissions for using command invoke are controlled through the
    Microsoft.ContainerService/managedClusters/runcommand/action and
    Microsoft.ContainerService/managedclusters/commandResults/read roles.