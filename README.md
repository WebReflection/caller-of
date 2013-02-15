caller-of
=========

The tiniest yet most powerful JS utility ever :D

```JavaScript
/*! (C) WebReflection, Mit Style License */
function callerOf(c) {'use strict'; return c.bind.call(c.call, c); }
```

### Examples
```JavaScript
var bind = callerOf(Function.bind);

// easy log
var log = bind(console.log, console);
log('it works');

// common borrowed methods
var
  has = callerOf({}.hasOwnProperty),
  whoIs = callerOf({}.toString),
  forEach = callerOf([].forEach),
  slice = callerOf([].slice);

has({a:1}, "a"); // true
has({a:1}, "toString"); // false

whoIs([]);    // "[object Array]"
whoIs(false); // "[object Boolean]"

slice(document.querySelectorAll("*")); // array
(function (obj){
  var args = slice(arguments, 1);
}());

forEach(document.getElementsByTagName("body"), log);
```
