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
```
env:
    TF_VAR_AWS_ACCESS_KEY: ${{ secrets.TF_VAR_AWS_ACCESS_KEY }}
    TF_VAR_AWS_SECRET_KEY: ${{ secrets.TF_VAR_AWS_SECRET_KEY }}
    AWS_ACCESS_KEY_ID: ${{ secrets.TF_VAR_AWS_ACCESS_KEY }}
    AWS_SECRET_ACCESS_KEY: ${{ secrets.TF_VAR_AWS_SECRET_KEY }} 
```
saved in github for terraform and aws as secret.

8.Create a Github Actions workflow for deployment via Terraform

For s3 backend, its create a file state.
![plot](./images/lesson1/s3buc.png)

And creates a instans
![plot](./images/lesson1/ec2.png)


More about Terraform backend i get from [Terraform S3](https://developer.hashicorp.com/terraform/language/backend/s3) documen

Answers about how to connect terraform to s3 aws [what env its needed](https://docs.aws.amazon.com/sdkref/latest/guide/feature-static-credentials.html) to auth