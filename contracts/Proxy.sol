// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// import "hardhat/console.sol";

// EOA = externally owned account (user)
// Proxy = contract that can be controlled by an EOA
// Logic = contract that can be controlled by a Proxy
// EOA -> Proxy -> Logic1
//              -> Logic2

contract Proxy {
    address implementation;

    function changeImplementation(address _implementation) external {
        implementation = _implementation;
    }
}

contract Logic1 {
    uint public x = 0;

    function changeX(uint _x) external {
        x = _x;
    }
}

contract Logic2 {
    uint public y = 0;

    function changeY(uint _y) external {
        y = _y;
    }
}
