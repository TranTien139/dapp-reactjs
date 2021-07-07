const ConvertLib = artifacts.require("ConvertLib");
const MetaCoin = artifacts.require("MetaCoin");
const DeveloperFactory = artifacts.require("DeveloperFactory");
// const { deployProxy } = require('@openzeppelin/truffle-upgrades');

module.exports = async function(deployer) {
  deployer.deploy(ConvertLib);
  deployer.link(ConvertLib, MetaCoin);
  deployer.deploy(MetaCoin);
  deployer.deploy(DeveloperFactory);
  // const instance = await deployProxy(DeveloperFactory, [42], { deployer });
  // console.log('Deployed', instance.address);
};
