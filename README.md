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

ENV for terraform as secret,access keys is tored in github repository secrets and pass as TF_VAR_*

8.Create a Github Actions workflow for deployment via Terraform

Variables separate in file variables.tf
before tf apply, two jobs in needed to be OK
1. setup - create and pull changes
2. configure-aws - connecting to aws