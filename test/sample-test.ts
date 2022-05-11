import { expect } from 'chai';
import { ethers } from 'hardhat';

describe('ZK-NFT Circuit tests', function () {
  beforeEach(async () => {
    const Verifier = await ethers.getContractFactory('');
    const verifier = await Verifier.deploy('');
    await verifier.deployed();
  });

  it('Should return ', async function () {
    // expect(await verifier.verifyProof()).to.be.true;
  });
});
