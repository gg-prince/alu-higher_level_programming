#!/usr/bin/node
/* eslint-disable camelcase */
exports.esrever = function (list) {
  const ggp_result = [];
  for (let ggp_i = list.length - 1; ggp_i >= 0; ggp_i--) {
    ggp_result.push(list[ggp_i]);
  }
  return ggp_result;
};
