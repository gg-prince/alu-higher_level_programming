#!/usr/bin/node
/* eslint-disable camelcase */
const Square = require('./5-square');

class ggp_Square extends Square {
  charPrint (c) {
    const ggp_char = c === undefined ? 'X' : c;
    for (let ggp_i = 0; ggp_i < this.height; ggp_i++) {
      console.log(ggp_char.repeat(this.width));
    }
  }
}

module.exports = ggp_Square;
