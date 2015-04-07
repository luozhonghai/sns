var redis = require('redis').createClient();

redis.subscribe('rt-change');

var io = require('socket.io').listen(process.env.PORT || 5001);

// var allowCrossDomain = function(req, res, next) {
//   res.header('Access-Control-Allow-Origin', "*")
//   //  res.header('Access-Control-Allow-Origin', "http://localhost");
//     res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
//     res.header('Access-Control-Allow-Headers', 'Content-Type');
// };

// app.configure(function() {
//     app.use(allowCrossDomain);
// });

io.on('connection', function(socket){
  redis.on('message', function(channel, message){
    socket.emit('rt-change', JSON.parse(message));
  });
});