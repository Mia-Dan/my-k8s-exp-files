FROM python:3.10.11

COPY ./runCPU.py /runCPU.py

CMD ["python", "/runCPU.py"]