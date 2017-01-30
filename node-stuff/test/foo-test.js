let chai = require('chai');
let expect = chai.expect;
let foo = require('../foo');

describe('foo', () => {
  it('should always pass', () => {
    expect(1).to.equal(1);
  });
  it('foo.ftr should equal arf', () => {
    expect(foo.ftr).to.equal('aarf');
  });
});
