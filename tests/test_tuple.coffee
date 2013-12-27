process.env.NODE_ENV = 'test'

path = require 'path'
assert = require 'assert'
Tuple = require(path.resolve()).Tuple

describe 'class "Tuple"', ->

  it 'should have class-method "isHash"', ->
    assert.equal typeof Tuple.isHash, 'function'

  describe 'class-method "isHash"', ->

    it 'should return true if Hash', ->
      assert.equal Tuple.isHash({a:1, b:2}), true

    it 'should return false if String', ->
      assert.equal Tuple.isHash("foo"), false

    it 'should return false if Array', ->
      assert.equal Tuple.isHash([1,2,3]), false

    it 'should return false if null', ->
      assert.equal Tuple.isHash(null), false


describe 'new Tuple({a:1, b:2})', ->

  tuple = new Tuple(a:1, b:2)

  it 'should have "data" property', ->
    assert.equal tuple.hasOwnProperty('data'), true

  it 'should match {a: 1, b: 2}', ->
    assert.equal tuple.match({a:1, b:2}), true

  it 'should match {a: 1, b: 2, c: 3}', ->
    assert.equal tuple.match({a:1, b:2, c:3}), true

  it 'should not match {a: 1, b: 3}', ->
    assert.equal tuple.match({a:1, b:3}), false

  it 'should not match {a: 1}', ->
    assert.equal tuple.match({a:1}), false

  it 'should not match [1,2,3]', ->
    assert.equal tuple.match([1,2,3]), false

  it 'should not match "foobar"', ->
    assert.equal tuple.match("foobar"), false

  it 'should match new Tuple({a:1, b:2, c:3})', ->
    assert.equal tuple.match(new Tuple({a:1, b:2, c:3})), true

  it 'should not match new Tuple({a:1, b:"foo"})', ->
    assert.equal tuple.match(new Tuple({a:1, b:"foo"})), false
