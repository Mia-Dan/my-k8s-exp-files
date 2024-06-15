FROM python:3.10.11

ADD runCPU.py

CMD ["python", "runCPU.py"]