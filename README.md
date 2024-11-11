# Task 5: Simple Application Deployment with Helm

## Submission

- Provide a PR with the application and Helm chart in a new repository.
- Ensure that the application is accessible from the internet.
- Provide a PR with the CI/CD pipeline code for the application deployment.
- Provide a README file documenting the application setup and deployment process.

## Evaluation Criteria (100 points for covering all criteria)

1. **Helm Chart Creation (40 points)**

   - A Helm chart for the WordPress application is created.
   **Answer**: all variables in wordpress-values.yaml file. Use exist charts as i understand [Git](https://github.com/bitnami/charts/tree/main/bitnami/wordpress)  

2. **Application Deployment (30 points)**

   - The application is deployed using the Helm chart.
   **Answer**: cant connect to DB, all passwords instaled in db logs ```Access denied for user 'bn_wordpress'@'10.42.0.34' (using password: YES)```  
   - The application is accessible from the internet.  
   **Answer**: Didn't check it

3. **Repository Submission (5 points)**

   - A new repository is created with the WordPress and Helm chart.
   **Answer**: Do not use separate repo for this task.  

4. **Verification (5 points)**

   - The application is verified to be running and accessible.

5. **Additional Tasks (20 points)**
   - **CI/CD Pipeline (10 points)**
     - A CI/CD pipeline is set up to automate the deployment of the application.
   - **Documentation (10 points)**
     - The application setup and deployment process are documented in a README file