poc-aws-s3-node-bypass-proxy
============================

Proof Of Concept: Making a proxy of S3 download content.

* Using express to serve a http endpoint for requesting files (in this case `/download/:bucket/:key`)
* Downloading a file from Amazon S3 
* Send it directly to the requested client via HTTP. No cache, no temp file.

Usage
=====
* You need to create your own `credentials-aws.json` according the official Amazon NPM `aws-node`: http://aws.amazon.com/de/sdkfornodejs/