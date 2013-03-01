/*! (C) WebReflection, Mit Style License */
(function (P, l) {
  'use strict';
  if (!P.bind) {
    P.bind = function (s) {
      var
        c = this,
        a = l.call(arguments, 1);
      return function bind() {
        return c.apply(s, a.concat(l.call(arguments)));
      };
    };
  }
}(Function.prototype, [].slice));