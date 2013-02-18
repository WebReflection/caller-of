// (C) WebReflection, Mit Style License
function callerOf(c) {'use strict'; return c.bind.apply(c.call, arguments); }
