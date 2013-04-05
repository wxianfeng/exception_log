// node /data/projects/rake_ui/app/views/rake_ui/rake_tasks/server.js -host=192.168.10.107 -log=/data/projects/entos/log/rake.log

var app = require('http').createServer(handler)
   , io = require('socket.io').listen(app)
   // , fs = require('fs')

var args = process.argv.slice(2);
var host = args[0].substr(6);
var log = args[1].substr(5)

console.log("listeing log:" + log);

app.listen(1337);

function handler (req, res) {
  
    var data = '<script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>' + 
'<script src="http://'+ host +':1337/socket.io/socket.io.js"></script>' +
'<style type="text/css" media="screen">' +
  'body {background:#000; color:#fff;}' +
'</style>' +

'<div style="width:100%">' +
  '<pre id="tail"></pre>' +
'</div>' +

'<script type="text/javascript">' +
  'var socket = io.connect("http://'+ host +':1337");' +
  'socket.on("tail", function (data) {' +
    '$("#tail").append(data.tail);'  + 
  '}); ' +
'</script>';

    res.writeHead(200);
    res.end(data);
  
}

io.sockets.on('connection', function (socket) {
	var spawn = require('child_process').spawn;
	var tail = spawn("tail", ["-n10000", "-f" , log]);
	
  tail.stdout.on("data", function (data) {
    // console.log(data.toString('utf-8'));
    socket.emit('tail', { tail : data.toString('utf-8') } )
  });
});

console.log('Log Server running now at http://'+ host +':1337/ in your browser');