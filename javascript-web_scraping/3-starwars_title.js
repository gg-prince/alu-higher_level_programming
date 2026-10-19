#!/usr/bin/node
/* eslint-disable camelcase */
const ggp_request = require('request');
const ggp_url = 'https://swapi-api.alx-tools.com/api/films/' + process.argv[2];

ggp_request(ggp_url, function (ggp_err, ggp_response, ggp_body) {
  if (ggp_err) {
    console.log(ggp_err);
  } else {
    console.log(JSON.parse(ggp_body).title);
  }
});
