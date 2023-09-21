const express = require('express');
const { json } = require('express/lib/response');
const app = express();
const http = require('http');
const server = http.createServer(app);
const { Server } = require("socket.io");
const io = new Server(server);


// if you want you can use this for website or server message
app.get('/', (req, res) => {
    res.sendFile(__dirname + '/index.html');
});

io.on('connection', (socket) => {
    console.log('a user connected');

    const userName = socket.handshake.query.userName;


    socket.on('message', (msg) => {
        console.log('message: ' + msg);
        console.log('User: ' + userName);
        const chatMessage = {
            message: msg,
            sender: userName,
            at: Date.now().toString()
        }
        io.emit('message', JSON.stringify(chatMessage));
    });


    socket.on('disconnect', () => {
        console.log('user disconnected');
    });
});

server.listen(8000, () => {
    console.log('listening on *:8000');

});