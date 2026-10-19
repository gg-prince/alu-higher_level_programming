#!/usr/bin/node
/* eslint-disable camelcase */
const ggp_num = parseInt(process.argv[2]);

if (isNaN(ggp_num)) {
  console.log('Not a number');
} else {
  console.log('My number: ' + ggp_num);
}
