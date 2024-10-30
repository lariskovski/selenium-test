FROM --platform=linux/amd64 python:3.14.0a1-bullseye

ARG CHROME_VERSION="130.0.6723.91"
# https://googlechromelabs.github.io/chrome-for-testing/#stable
# https://github.com/password123456/setup-selenium-with-chrome-driver-on-ubuntu_debian

RUN apt update && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt-get install -y ./google-chrome-stable_current_amd64.deb && \
    wget https://storage.googleapis.com/chrome-for-testing-public/${CHROME_VERSION}/linux64/chromedriver-linux64.zip &&\
    unzip chromedriver-linux64.zip -d opt/

COPY requirements.txt .
RUN pip install -r requirements.txt
COPY --chmod=0755 main.py .

CMD ["python", "main.py"]
