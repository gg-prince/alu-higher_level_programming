#!/usr/bin/node
/* eslint-disable camelcase */
exports.nbOccurences = function (list, searchElement) {
  let ggp_count = 0;
  for (let ggp_i = 0; ggp_i < list.length; ggp_i++) {
    if (list[ggp_i] === searchElement) {
      ggp_count++;
    }
  }
  return ggp_count;
};
