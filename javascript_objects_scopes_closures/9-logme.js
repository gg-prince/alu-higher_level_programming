#!/usr/bin/node
/* eslint-disable camelcase */
let ggp_printed = 0;

exports.logMe = function (item) {
  console.log(ggp_printed + ': ' + item);
  ggp_printed++;
};
