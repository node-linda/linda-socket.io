(function() {
  var Tuple;

  module.exports = Tuple = (function() {
    Tuple.isHash = function(data) {
      if (!data || data instanceof Array || typeof data !== "object") {
        return false;
      }
      return true;
    };

    function Tuple(data) {
      this.data = data;
    }

    Tuple.prototype.match = function(tuple) {
      var data, k, v, _ref;
      if (!Tuple.isHash(tuple)) {
        return false;
      }
      data = tuple instanceof Tuple ? tuple.data : tuple;
      _ref = this.data;
      for (k in _ref) {
        v = _ref[k];
        if (v !== data[k]) {
          return false;
        }
      }
      return true;
    };

    return Tuple;

  })();

}).call(this);