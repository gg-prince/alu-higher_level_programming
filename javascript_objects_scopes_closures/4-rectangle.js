#!/usr/bin/node
/* eslint-disable camelcase */
class Rectangle {
  constructor (w, h) {
    if (Number.isInteger(w) && w > 0 && Number.isInteger(h) && h > 0) {
      this.width = w;
      this.height = h;
    }
  }

  print () {
    for (let ggp_i = 0; ggp_i < this.height; ggp_i++) {
      console.log('Ggp ' + 'X'.repeat(this.width));
    }
  }

  rotate () {
    const ggp_tmp = this.width;
    this.width = this.height;
    this.height = ggp_tmp;
  }

  double () {
    this.width *= 2;
    this.height *= 2;
  }
}

module.exports = Rectangle;
