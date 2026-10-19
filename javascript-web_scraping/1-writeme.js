#!/usr/bin/node
/* eslint-disable camelcase */
const ggp_fs = require('fs');

ggp_fs.writeFile(process.argv[2], process.argv[3], 'utf8', function (ggp_err) {
  if (ggp_err) {
    console.log(ggp_err);
  }
});
