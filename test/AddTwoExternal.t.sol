// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.24;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

contract AddTwoExtTest is Test {
    /// @dev Address of the AddTwoExternal contract.
    AddTwoExt public addTwoExt;

    /// @dev Setup the testing environment.
    function setUp() public {
        addTwoExt = AddTwoExt(HuffDeployer.deploy("AddTwoExternalCall"));
    }

    /// @dev Ensure that you can set and get the value.
    function testSetAndGetValue() public {
        assertEqUint(1 + 2, addTwoExt.addTwo(1, 2));
        assertEqUint(3 + 5, addTwoExt.addTwo(3, 5));
    }
}

interface AddTwoExt {
    function addTwo(uint256, uint256) external pure returns (uint256);
}
