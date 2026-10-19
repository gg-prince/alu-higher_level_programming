#!/usr/bin/node
/* eslint-disable camelcase */
const ggp_request = require('request');

ggp_request.get(process.argv[2], function (ggp_err, ggp_response) {
  if (ggp_err) {
    console.log(ggp_err);
  } else {
    console.log('code: ' + ggp_response.statusCode);
  }
});
