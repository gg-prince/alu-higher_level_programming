#!/usr/bin/node
/* eslint-disable camelcase */
const ggp_request = require('request');

ggp_request(process.argv[2], function (ggp_err, ggp_response, ggp_body) {
  if (ggp_err) {
    console.log(ggp_err);
  } else {
    const ggp_todos = JSON.parse(ggp_body);
    const ggp_counts = {};
    for (let ggp_i = 0; ggp_i < ggp_todos.length; ggp_i++) {
      if (ggp_todos[ggp_i].completed) {
        const ggp_id = ggp_todos[ggp_i].userId;
        ggp_counts[ggp_id] = (ggp_counts[ggp_id] || 0) + 1;
      }
    }
    console.log(ggp_counts);
  }
});
