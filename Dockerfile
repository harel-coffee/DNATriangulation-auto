FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
				       build-essential \
                                       wget \
			    	       rsync \
			    	       net-tools \
			    	       zsh \
			    	       python \
			    	       python-pip \
			    	       python-tk \
			    	       vim \
                                       less \
			    	       libfreetype6-dev \
			    	       libxft-dev

RUN pip install numpy==1.10.4 scipy==0.16.1 matplotlib==1.5 scikit-learn==0.18 hmmlearn==0.2.0 h5py
# a hack to trigger matplotlib upgrade and correct installation, no-deps prevents dependencies upgrades ...
RUN pip install matplotlib==1.5.1 --upgrade --no-deps


RUN useradd -m admin

USER admin
WORKDIR /home/admin

RUN mkdir /home/admin/scripts

RUN mkdir /home/admin/scripts/Data

RUN mkdir /home/admin/scripts/mypy


COPY scripts/* /home/admin/scripts/

COPY data/* /home/admin/scripts/Data/

COPY scripts/mypy/* /home/admin/scripts/mypy/

USER root

RUN chown admin:admin /home/admin/scripts/*

USER admin
