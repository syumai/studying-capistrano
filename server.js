const http = require('http');
const server = http.createServer();

server.on('request', (req, res) => {
	res.writeHead(200, {'Content-Type': 'application/json'});
	res.write(JSON.stringify({ status: 200, message: 'Success!'}));
	res.end();
});

const port = 3070;
server.listen(port, '127.0.0.1');
console.log(`Listening to the port: ${port}`);

