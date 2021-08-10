.PHONY: run-local
run-local: image
	docker pull asia-northeast1-docker.pkg.dev/dor-ds-sandbox/gcb-sample/gcb-sample:tag1
	docker run asia-northeast1-docker.pkg.dev/dor-ds-sandbox/gcb-sample/gcb-sample:tag1 -m gcb_sample 30 1


.PHONY: image
image:
	gcloud builds submit --config cloudbuild.yaml


.PHONY: repository
repository:
	gcloud artifacts repositories create gcb-sample --repository-format=docker --location=asia-northeast1 --description="Docker repository"


.PHONY: run
run:
	cd run && gcloud builds submit --config cloudbuild.yaml --substitutions=_NUM_TASK=60
