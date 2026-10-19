#!/usr/bin/node
/* eslint-disable camelcase */
const ggp_arg = process.argv[2];

if (ggp_arg === undefined) {
  console.log('No argument');
} else {
  console.log(ggp_arg);
}
