#!/usr/bin/node
/* eslint-disable camelcase */
const ggp_fs = require('fs');

ggp_fs.readFile(process.argv[2], 'utf8', function (ggp_err, ggp_data) {
  if (ggp_err) {
    console.log(ggp_err);
  } else {
    console.log(ggp_data);
  }
});
