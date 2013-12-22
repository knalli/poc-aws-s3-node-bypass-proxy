poc-aws-s3-node-bypass-proxy
============================

Proof Of Concept: Making a proxy of S3 download content.

* Using express to serve a http endpoint for requesting files (in this case `/download/:bucket/:key`)
* Downloading a file from Amazon S3 
* Send it directly to the requested client via HTTP. No cache, no temp file.

Usage
=====
* You need to create your own `credentials-aws.json` according the official Amazon NPM `aws-node`: http://aws.amazon.com/de/sdkfornodejs/
* Start the server with `coffee server.coffee`, the server listens on port 3005 at default on the route `/download/<bucket>/<key>`.
* If you want to download `http://s3.amazonaws.com/[bucket-name]/[key-name]` use `http://localhost:3005/download/[bucket-name]/[key-name]`


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/knalli/poc-aws-s3-node-bypass-proxy/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

