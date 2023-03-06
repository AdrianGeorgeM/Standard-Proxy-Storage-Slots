import { loadFixture } from '@nomicfoundation/hardhat-network-helpers';
import { assert } from 'chai';
import { ethers } from 'hardhat';

describe('Proxy', function () {
	// We define a fixture to reuse the same setup in every test.
	// We use loadFixture to run this setup once, snapshot that state,
	// and reset Hardhat Network to that snapshot in every test.
	async function deployFixture() {
		const Proxy = await ethers.getContractFactory('Proxy');
		const proxy = await Proxy.deploy();

		const Logic1 = await ethers.getContractFactory('Logic1');
		const logic1 = await Logic1.deploy();

		const Logic2 = await ethers.getContractFactory('Proxy');
		const logic2 = await Logic2.deploy();

		return { proxy, logic1, Logic2 };
	}

	it('Should work with logic1', async function () {
		const { proxy, logic1 } = await loadFixture(deployFixture); // loadFixture will run the deployFixture function and return the values in the return object
	});

	// it('Should work with upgrades', async function () {
	// 	const {} = await loadFixture(deployFixture);
	// });
});