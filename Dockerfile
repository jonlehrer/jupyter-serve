FROM ubuntu:18.04

RUN apt-get update \
    && apt-get install -y \
        python3 \
        python3-pip \
    && apt-get clean

COPY requirements.txt /tmp/reqirements.txt
RUN pip3 install -r /tmp/reqirements.txt

RUN useradd -m jupyter

EXPOSE 8888

COPY . /opt/jupyter-serve
WORKDIR /opt/jupyter-serve
USER jupyter

CMD ["jupyter", "notebook", "--no-browser", "--ip=0.0.0.0"]