#!/usr/bin/node
/* eslint-disable camelcase */
exports.converter = function (base) {
  return function (ggp_n) {
    return ggp_n.toString(base);
  };
};
