# GKE Terraform (Ankra GKE Clusters)

## Environments
* platform

## Setup
### Google Auth
You need to authenticate with Google Cloud before running the commands below.
```bash
gcloud auth application-default login
```

### Init
```bash
tofu init
```

## Run
### Pre Execution (IMPORTANT)
* **Move the state files for the environment you want to run against from states/<environment> to the project root**

### Plan
```bash
tofu plan -var-file="environments/<environment>.tfvars"
```

### Apply
```bash
tofu apply -var-file="environments/<environment>.tfvars"
```

### Post Execution (IMPORTANT)
* **Move the state files for the environment you ran against back to states/<environment>**
