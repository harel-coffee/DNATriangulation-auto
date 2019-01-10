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

RUN pip install numpy==1.10.4 scipy==0.16.1 matplotlib==1.5.1 scikit-learn==0.18 hmmlearn==0.2.0 h5py

RUN useradd -m admin

USER admin
WORKDIR /home/admin

RUN mkdir /home/admin/scripts

RUN mkdir /home/admin/scripts/Data

COPY scripts/* /home/admin/scripts/

COPY data/* /home/admin/scripts/Data/

USER root

RUN chown admin:admin /home/admin/scripts/*

USER admin
