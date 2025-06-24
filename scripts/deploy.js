const hre = require("hardhat");

async function main() {
  const [deployer] = await hre.ethers.getSigners();

  console.log("Deploying contract with:", deployer.address);

  const GameItems = await hre.ethers.getContractFactory("GameItems");
  const gameItems = await GameItems.deploy(deployer.address);

  await gameItems.waitForDeployment(); 

  const address = await gameItems.getAddress(); 
  console.log("GameItems deployed to:", address);
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});
