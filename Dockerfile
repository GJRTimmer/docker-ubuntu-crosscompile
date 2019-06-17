FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=Europe/Amsterdam

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update -y && \
	apt-get install -y software-properties-common && \
	add-apt-repository -y ppa:ubuntu-toolchain-r/test && \
	apt-get update -y && \
    apt-get install -y \
		build-essential \
		cmake \
		make \
		binutils-mingw-w64 \
		gcc-mingw-w64-i686 \
		gcc-mingw-w64 \
		g++-6 \
		g++-7 \
		git \
		ca-certificates \
		gcc-multilib \
		g++-multilib \
		file \
		libz-dev \
		perl \
		python \
		tcl \
		tcl-dev \
		unzip \
		zip \
		curl \
		wget

ARG BUILD_DATE
ARG VCS_REF

LABEL \
	nl.timmertech.build-date=${BUILD_DATE} \
	nl.timmertech.name=ubuntu-crosscompile \
	nl.timmertech.vendor=timmertech.nl \
	nl.timmertech.vcs-url="https://gitlab.timmertech.nl/docker/ubuntu/crosscompile.git" \
	nl.timmertech.vcs-ref=${VCS_REF} \
	nl.timmertech.license=MIT