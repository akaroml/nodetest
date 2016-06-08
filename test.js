
var http = require('http');

var url = require('url');

 

http.createServer(function (req, res) {        

　　    var path = url.parse(req.url).pathname;

        var dt=new Date();

        res.writeHead(200, {'Content-Type': 'text/plain'});

        res.write("Hello,World ! \n"+dt.getTime());

        res.end();}).listen(8888, "127.0.0.1");

  

console.log('access:http://localhost:8888');