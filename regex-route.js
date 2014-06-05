var ref$, filter, map, listsToObj, RegexRoute;
ref$ = require('prelude-ls'), filter = ref$.filter, map = ref$.map, listsToObj = ref$.listsToObj;
RegexRoute = (function(){
  RegexRoute.displayName = 'RegexRoute';
  var prototype = RegexRoute.prototype, constructor = RegexRoute;
  function RegexRoute(routes){
    var this$ = this instanceof ctor$ ? this : new ctor$;
    this$.routes = routes != null
      ? routes
      : [];
    this$.readTuple = bind$(this$, 'readTuple', prototype);
    return this$;
  } function ctor$(){} ctor$.prototype = prototype;
  prototype.addRoute = function(route, fun){
    if (typeof route === 'string') {
      return this.routes.push(route, fun);
    }
  };
  prototype.readTuple = function(pair){
    return listsToObj(['condition', 'name'], pair.split(':'));
  };
  prototype.fromString = function(string){
    if (/^(\/?(.*?):([^\/]*))*\/?$/.test(string)) {
      return filter(function(it){
        return it.name != null;
      }, map(this.readTuple, string.split('/')));
    } else {
      throw new Error("Invalid regex-route pattern");
    }
  };
  return RegexRoute;
}());
module.exports = new RegexRoute;
function bind$(obj, key, target){
  return function(){ return (target || obj)[key].apply(obj, arguments) };
}