var express = require('express'),
  app = express(),
  port = process.env.PORT || 3000,
  bodyParser = require('body-parser');
  

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.get('/', function (req, res) {
    res.send('Hello TROLOLO World!');
    console.log('New request arrived for: ' +req.originalUrl )
  })

app.use(function(req, res) {
    res.status(404).send({url: req.originalUrl + ' not found'});
    console.log('404 for: ' +req.originalUrl )
  });

app.listen(port);

console.log('Server Started on: ' + port);


