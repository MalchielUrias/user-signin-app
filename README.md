# User Signin App
This application creates a secure way to authenticate requests to REST API using JSON Web Tokens (JWT). 

When two systems (applications or services) need to exchange data, there is a need for the systems to authenticate and identify themselves. You can use a JSON Web Token to identify your user without 
sending private credentials on every request. 

If you apply this concept to a REST API, you’ll see how our client-server interactions can benefit from these mechanics. 

Our user signin-app shows how this project works by demonstrating the user sign-up process and login process.


## Infrastructure
The infrastructure was created using Terrafrom. It was also made available for deployment into two cloud provider: AWS and GCP.

### AWS Resources:
Each resource is created as a module then referenced in the main.tf. This is to promote reusability.
- AWS VPC
- AWS EKS

### GCP Resources:
- VPC
- GKE

## Code
The application was built using Golang and can be tested using any API tester such as Postman

Modules used:
- Golang Gin
- Golang Gorm
- Go JWT
- Golang Bcryt 
