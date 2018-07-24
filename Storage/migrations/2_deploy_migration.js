var testStorage = artifacts.require("./testStorage.sol");

module.exports = function(deployer) {
  deployer.deploy(testStorage);
};