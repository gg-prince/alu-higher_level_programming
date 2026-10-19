#!/usr/bin/node
/* eslint-disable camelcase */
const ggp_nums = process.argv.slice(2).map(Number);

if (ggp_nums.length <= 1) {
  console.log(0);
} else {
  ggp_nums.sort((a, b) => b - a);
  console.log(ggp_nums[1]);
}
