#!/usr/bin/node
/* eslint-disable camelcase */
function ggp_factorial (n) {
  if (isNaN(n) || n <= 1) {
    return 1;
  }
  return n * ggp_factorial(n - 1);
}

console.log(ggp_factorial(parseInt(process.argv[2])));
