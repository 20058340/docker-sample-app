const express = require('express');
const app = express();
const port = 8081;

app.get('/', (req, res) => {
  res.send('Welcome!');
});

app.listen(port, () => {
  console.log(`Example app listening at http://0.0.0.0:${port}`);
});
