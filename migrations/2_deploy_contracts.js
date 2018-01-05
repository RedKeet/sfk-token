var SktCoin = artifacts.require("./SktCoin.sol");

module.exports = function(deployer) {
  deployer.deploy(SktCoin);
};
