#!/usr/bin/node
/* eslint-disable camelcase */
const ggp_request = require('request');

ggp_request(process.argv[2], function (ggp_err, ggp_response, ggp_body) {
  if (ggp_err) {
    console.log(ggp_err);
  } else {
    const ggp_films = JSON.parse(ggp_body).results;
    let ggp_count = 0;
    for (let ggp_i = 0; ggp_i < ggp_films.length; ggp_i++) {
      const ggp_characters = ggp_films[ggp_i].characters;
      for (let ggp_j = 0; ggp_j < ggp_characters.length; ggp_j++) {
        if (ggp_characters[ggp_j].includes('/people/18/')) {
          ggp_count++;
          break;
        }
      }
    }
    console.log(ggp_count);
  }
});
