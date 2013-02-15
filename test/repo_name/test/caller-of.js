//remove:
var callerOf = require('../build/caller-of.node.js');
//:remove

wru.test([
  {
    name: "100% code coverage",
    test: function () {
      var
        slice = callerOf([].slice),
        fakeObject = {length:2,"0":"a","1":"b",};
      wru.assert("it slices", slice(fakeObject).join(",") === "a,b");
      wru.assert("it slices(1)", slice(fakeObject, 1).join(",") === "b");
    }
  }
]);