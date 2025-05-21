# Makefile voor dirtyZero iOS-app

PROJECT = dirtyZero.xcodeproj
SCHEME = dirtyZero
CONFIGURATION = Release
DESTINATION = 'generic/platform=iOS'

.PHONY: all build clean test archive ipa

all: build

build:
	xcodebuild \
		-project $(PROJECT) \
		-scheme $(SCHEME) \
		-configuration $(CONFIGURATION) \
		-destination $(DESTINATION) \
		clean build

test:
	xcodebuild \
		-project $(PROJECT) \
		-scheme $(SCHEME) \
		-configuration $(CONFIGURATION) \
		-destination 'platform=iOS Simulator,name=iPhone 14' \
		clean test

clean:
	xcodebuild clean \
		-project $(PROJECT) \
		-scheme $(SCHEME) \
		-configuration $(CONFIGURATION)

archive:
	xcodebuild archive \
		-project $(PROJECT) \
		-scheme $(SCHEME) \
		-configuration $(CONFIGURATION) \
		-archivePath ./build/$(SCHEME).xcarchive

ipa:
	./ipabuild.sh
