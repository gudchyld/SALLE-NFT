import { ethers } from "hardhat";

async function main() {
  
  const jennym = await ethers.getContractFactory("JennyNFT");
  const Jenny = await jennym.deploy();

  await Jenny.deployed();

  console.log(`NFT Contract deployed to :  ${Jenny.address}`);

  await Jenny.safeMint("0xc1d7892D962B5385918781a1021daD00B74B62BF",1,"ipfs://QmTWyDaC9YHTnbFFpS3mjM1iLJemgf6Vq1hAiYDpM6StSc")
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
