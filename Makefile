.PHONY: image
image:
	gcloud builds submit --config cloudbuild.yaml


.PHONY: repository
repository:
	gcloud artifacts repositories create gcb-sample --repository-format=docker --location=asia-northeast1 --description="Docker repository"
