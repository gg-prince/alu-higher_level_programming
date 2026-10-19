#!/usr/bin/node
/* eslint-disable camelcase */
const ggp_request = require('request');
const ggp_fs = require('fs');

ggp_request(process.argv[2], function (ggp_err, ggp_response, ggp_body) {
  if (ggp_err) {
    console.log(ggp_err);
  } else {
    ggp_fs.writeFile(process.argv[3], ggp_body, 'utf8', function (ggp_err2) {
      if (ggp_err2) {
        console.log(ggp_err2);
      }
    });
  }
});
