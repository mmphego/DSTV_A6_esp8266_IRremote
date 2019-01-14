.PHONY: install build upload clean help

help:
	@echo "Please use 'make <target>' where <target> is one of"
	@echo "  install: 	Install Platformio via pip"
	@echo "  build: 	Compile arduino code!"
	@echo "  upload: 	Upload to esp8266"
	@echo "  clean: 	Do some cleaning up"

install:
	@pip install --user -U platformio
	@platformio update
	@platformio lib -g install 1089 1826 305 549 5509 551 64 89

build:
	@platformio run
	@docker stop sonarqube || true

upload:
	@platformio run --target upload

clean:
	@platformio run -t clean