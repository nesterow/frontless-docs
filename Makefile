default:
	java -jar ./bin/SkyDocs-v0.7.4.jar build
	cd landing && npm i
	cd landing && gulp
	rm build/index.html && cp landing/index.html build/index.html

serve:
	java -jar ./bin/SkyDocs-v0.7.4.jar serve

