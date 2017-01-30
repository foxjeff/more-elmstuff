const test = require('tape');

test('A passing test', (assert) => {
  assert.plan(1);
  assert.pass('this be passing');
  assert.end();
});

test('assertions with tape.', (assert) => {
  const expected = 'something to test';
  const actual = 'sonething to test';

  assert.equal(actual, expected,
    'Given two mismatched values, .equal() should produced a nice bug report');

  assert.end();
});
