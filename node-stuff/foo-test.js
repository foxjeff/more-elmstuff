let chai = require('chai');
let expect = chai.expect;
let foo = require('../foo');

describe('foo', () => {
  it('should do stuff', () => {
    expect(1).to.equal(1);
    expect(foo.ftr).to.equal('foo-test.js');
  });
});
