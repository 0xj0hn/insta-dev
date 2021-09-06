FROM python:latest
COPY * ./
RUN pip3 install -r requrements.txt
CMD ["uvicorn","main:app","--reload"]
