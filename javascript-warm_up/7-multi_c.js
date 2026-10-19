#!/usr/bin/node
/* eslint-disable camelcase */
const ggp_x = parseInt(process.argv[2]);

if (isNaN(ggp_x)) {
  console.log('Missing number of occurrences');
} else {
  for (let ggp_i = 0; ggp_i < ggp_x; ggp_i++) {
    console.log('C is fun');
  }
}
