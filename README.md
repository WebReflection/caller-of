caller-of
=========

The tiniest yet most powerful JS utility ever :D

```JavaScript
/*! (C) WebReflection, Mit Style License */
function callerOf(c) {'use strict'; return c.bind.call(c.call, c); }
```

### What Does Above Code Do
Here is what we usually do
```JavaScript
object.hasOwnProperty(key)
```
Here is what `callerOf` create
```JavaScript
hasOwnProperty(object, key)
```
so we can borrow any method at any time and reuse it in a minifier friendly way.

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

### Compatibility
Every JavaScript engine I know, included IE

### What If No Function.prototype.bind
You can use this tiny yet working polyfill ^_^
```JavaScript
// 139 bytes gzipped
/*! (C) WebReflection, Mit Style License */
(function (P) {
  'use strict';
  if (!P.bind) {
    P.bind = function (s) {
      var
        c = this,
        l = [].slice,
        a = l.call(arguments, 1);
      return function bind() {
        return c.apply(s, a.concat(l.call(arguments)));
      };
    };
  }
}(Function.prototype));
```