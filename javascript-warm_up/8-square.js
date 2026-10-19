#!/usr/bin/node
/* eslint-disable camelcase */
const ggp_size = parseInt(process.argv[2]);

if (isNaN(ggp_size)) {
  console.log('Missing size');
} else {
  for (let ggp_i = 0; ggp_i < ggp_size; ggp_i++) {
    let ggp_row = '';
    for (let ggp_j = 0; ggp_j < ggp_size; ggp_j++) {
      ggp_row += 'X';
    }
    console.log(ggp_row);
  }
}
