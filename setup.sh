gcloud artifacts repositories create rshiny-docker-repo --repository-format=docker --location=europe-west1 --description="RShiny Docker Dashboards repo"
PROJECT_ID=$(gcloud config list --format='value(core.project)')
PROJECT_NUMBER=$(gcloud projects describe $PROJECT_ID --format='value(projectNumber)')
gcloud projects add-iam-policy-binding $PROJECT_ID     --member=serviceAccount:$PROJECT_NUMBER@cloudbuild.gserviceaccount.com     --role=roles/run.admin
gcloud iam service-accounts add-iam-policy-binding     $PROJECT_NUMBER-compute@developer.gserviceaccount.com     --member=serviceAccount:$PROJECT_NUMBER@cloudbuild.gserviceaccount.com     --role=roles/iam.serviceAccountUser

