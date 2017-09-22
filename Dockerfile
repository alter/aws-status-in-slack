FROM python:alpine
MAINTAINER Roman Dolgov "alter.pub@gmail.com"
RUN apk --update add py-pip
RUN pip install awscli
COPY . /src/aws-status-slack
WORKDIR /src/aws-status-slack
RUN pip2 install --no-cache-dir -r requirements.txt
ENTRYPOINT ["/src/aws-status-slack/aws_status_slack.py"]

