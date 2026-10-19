#!/usr/bin/node
/* eslint-disable camelcase */
const ggp_count = process.argv.length - 2;

if (ggp_count === 0) {
  console.log('No argument');
} else if (ggp_count === 1) {
  console.log('Argument found');
} else {
  console.log('Arguments found');
}
