// app.js
const express = require('express');
const app = express();
const port = 8080;

app.get('/', (req, res) => {
  res.send('Barath!');
});

app.listen(port, () => {
  console.log(`Example app listening at http://54.74.245.12:8080/);
});
