FROM python:3.13.3 AS base

FROM base AS builder
WORKDIR /builder
COPY app.py .

FROM python:3.13.3-alpine
WORKDIR /hivebox
COPY --from=builder /builder/app.py .

ENTRYPOINT [ "python" ] 
CMD [ "app.py" ]