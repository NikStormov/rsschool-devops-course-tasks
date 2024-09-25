# rsschool-devops-course-tasks
1.Install AWS CLI and Terraform

![plot](./images/lesson1/versions_tf_aws.png)

2.Create IAM User and Configure MFA

![plot](./images/lesson1/mfa_access.png)

3.Configure AWS CLI

Can run previous commands from cli to get info from AWS.

4.Create a Github repository for your Terraform code

My repository  [link](https://github.com/NikStormov/rsschool-devops-course-tasks)

5.Create a bucket for Terraform states

ENV: `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` saved in github for terraform as secret, contains first characters TF_VAR_*

8.Create a Github Actions workflow for deployment via Terraform

Variables separate in file variables.tf
before tf apply, jobs in needed to be OK
1. configure-aws - connecting to aws

More about Terraform backend i get from [Terraform S3](https://developer.hashicorp.com/terraform/language/backend/s3)

Answers about how to connect terraform to s3 aws [what env its needed](https://docs.aws.amazon.com/sdkref/latest/guide/feature-static-credentials.html)