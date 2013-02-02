express = require 'express'
connect = require 'connect'
port = process.env.PORT ? process.argv.splice(2)[0] ? 3005
app = express()

# Amazon
AWS = require 'aws-sdk'
AWS.config.loadFromPath './credentials-aws.json'
s3 = new AWS.S3()

app.configure ->
  app.use express.logger 'dev'
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.errorHandler()
  #app.use connect.compress()
  app.use app.router

  app.get '/download/:bucket/:key', (req, res) ->
    request = s3.client.getObject(Bucket: req.params.bucket, Key: req.params.key)
    headerSent = false
    request.on 'httpData', (chunk, response) ->
      s3Response = response.httpResponse
      unless headerSent
        params =
          'content-type': s3Response.headers['content-type']
          'content-length': s3Response.headers['content-length']
          'Content-Disposition': 'attachment; filename=' + response.request.params.Key
        res.writeHead s3Response.statusCode, params
        headerSent = true
      res.write chunk
      console.log 'Fetched chunk -> http response.'
    request.on 'complete', ->
      console.log 'COMPLETED!'
    request.send()

app.listen port, ->
  console.log "started web server at http://localhost:#{port}"