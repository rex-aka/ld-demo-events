#
# Makefile for event stations
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#

BUILD ?= $(PWD)/build
DOMAIN ?= launchdarklydemos.com
MAKE := $(MAKE) --no-print-directory

.PHONY: help station-1 station-2 stations deploy
.DEFAULT_GOAL : help

help:
	@echo 'Usage:'
	@echo
	@echo '    make station-1           build and deploy station-1'
	@echo '    make station-2           build and deploy station-2'
	@echo '    make both-stations       build and deploy both stations'
	@echo '    make deploy              run app/app.py'
	@echo

build-env:
	cp .env.$(STATION) .env
	npm run build

station-1: export STATION := gartner-eu-1
station-1:
	$(MAKE) build-env
	$(MAKE) deploy

station-2: export STATION := gartner-eu-2
station-2:
	$(MAKE) build-env
	$(MAKE) deploy

stations:
	$(MAKE) station-1
	$(MAKE) station-2

deploy:
	aws s3 sync ./build/ s3://$(STATION).$(DOMAIN)
