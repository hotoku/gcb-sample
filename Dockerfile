FROM python:3.7.10 as builder

COPY pyproject.toml poetry.lock ./

RUN pip install -U pip && pip install poetry && poetry export -f requirements.txt > requirements.txt


FROM python:3.7.10

ENV PYTHONUNBUFFERED=1

COPY --from=builder /requirements.txt .

RUN pip install -U pip && pip install -r requirements.txt

COPY gcb_sample/ /

ENTRYPOINT ["python"]
