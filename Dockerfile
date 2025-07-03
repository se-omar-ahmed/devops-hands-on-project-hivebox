FROM python:3.13.3-alpine AS base

FROM base AS builder
WORKDIR /builder
COPY ./requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY ./app.py .

FROM builder AS runner

EXPOSE 80
ENTRYPOINT [ "fastapi" ]
CMD [ "run", "app.py", "--port", "80" ]