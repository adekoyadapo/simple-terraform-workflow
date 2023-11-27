
---

# Terraform CICD workflow

## Overview

This repository demonstrates the use of Terraform and github actions to create a simple Google cloud resource like a Google Cloud Storage (GCS) bucket on Google Cloud Platform (GCP). Additionally, an initialization script is provided to set up the Terraform backend using a GCS bucket.

## Prerequisites

Before you begin, ensure you have the following:

- [Terraform](https://www.terraform.io/) installed locally.
- [Google Cloud SDK](https://cloud.google.com/sdk) installed and configured.
- A GCP project with the necessary permissions to create GCS buckets.
-  Create a GCP Service Account and Key Follow these steps to create a service account and generate a JSON key file:
    - In the Google Cloud Console, navigate to the "IAM & Admin" page for your project.
    - Click on "Service accounts" in the left sidebar.
    - Click "Create Service Account" at the top of the page.
    - Fill in the required fields and grant the necessary permissions to the service account, such as Storage Admin for GCS.
    - Click "Create" to create the service account.
    - Once the service account is created, click on it in the list of service accounts.
    - Navigate to the "Keys" tab and click "Add Key."
    - Choose the JSON key type and click "Create." This will download a JSON file containing your service account credentials.
    - Store the downloaded JSON key securely.

## Getting Started

### 1. Initialize the Terraform Backend

Run the provided initialization script to create the GCS bucket for storing Terraform state:

```bash
./init.sh create
```

Replace `bk-tf-12345-tfstate` with your desired bucket name. If not provided, the script will use the default name `bk-tf-12345-tfstate`.

### 2. Configure GitHub Secrets

To enable the GitHub Actions workflow, add the GCP service account key as a secret in your GitHub repository.

- Generate a GCP service account key file with the necessary permissions.
- To add the credentials they need to be altered a bit to be stored in the variable. You need to remove all newline characters from the file. Use following commands to convert JSON multi-line to single line
    - Open the file with vim
```
vi gcp-credential.json
press :

Add the following 
%s;\n; ;g
Press enter.

press : again

type wq!
```
- In your GitHub repository, go to **Settings > Secrets > New repository secret**.
- Name the secret `GOOGLE_CREDENTIALS` and paste the contents of your service account key file.

### 3. Run Terraform Workflow

Commit and push your changes to trigger the GitHub Actions workflow. The workflow will use the provided service account key to authenticate with GCP and create the Resource in the repo.

## Cleanup

To delete the GCS bucket and remove the Terraform backend, run:
Remove the content of the main file or all resource block and push to main, then run the below

```bash
./init.sh destroy
```

## Additional Information

- Ensure the service account has the necessary permissions for GCS bucket management.
- Refer to the [Google Cloud Storage documentation](https://cloud.google.com/storage/docs) for more details.
- Troubleshoot GitHub Actions workflows using the [GitHub Actions documentation](https://docs.github.com/en/actions).