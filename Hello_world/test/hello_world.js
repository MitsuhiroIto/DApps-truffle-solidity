var HelloWorld = artifacts.require("HelloWorld");
 
contract('HelloWorld', function(accounts) {
  describe('word method', function() {
    var obj;
    let str = "TestTest";
 
    before(async function () {
      obj = await HelloWorld.new();
    });
 
    it("should set new word", async function() {
      await obj.set(str);
      let result = await obj.get();
      assert.equal(result, str);
    });
  });
});