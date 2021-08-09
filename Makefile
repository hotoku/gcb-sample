.PHONY: run-local
run-local: image
	docker pull asia-northeast1-docker.pkg.dev/dor-ds-sandbox/gcb-sample/gcb-sample:tag1
	docker run asia-northeast1-docker.pkg.dev/dor-ds-sandbox/gcb-sample/gcb-sample:tag1 -m gcb_sample


.PHONY: image
image:
	gcloud builds submit --config cloudbuild.yaml


.PHONY: repository
repository:
	gcloud artifacts repositories create gcb-sample --repository-format=docker --location=asia-northeast1 --description="Docker repository"
