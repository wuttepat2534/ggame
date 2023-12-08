const socketIo = require('socket.io');

let io;

module.exports = {
    init: (server) => {
        if(!io) {
            io = socketIo(server, {
                cors: {
                    origin: "*",
                    methods: ["GET", "POST"]
                }
            });
        }
        return io;
    },
    getIO: () => {
        if (!io) {
            throw new Error('Socket.io not initialized!');
        }
        return io;
    }
};