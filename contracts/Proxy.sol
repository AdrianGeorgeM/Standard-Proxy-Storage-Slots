// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import "./StorageSlot.sol";

// import "hardhat/console.sol";

// EOA = externally owned account (user)
// Proxy = contract that can be controlled by an EOA
// Logic = contract that can be controlled by a Proxy
// EOA -> Proxy -> Logic1
//              -> Logic2

contract Proxy {
    // address implementation;

    function changeImplementation(address _implementation) external {
        StorageSlot.getAddressSlot(keccak256("impl")).value = _implementation;
    }

    fallback() external {
        (bool success, ) = StorageSlot
            .getAddressSlot(keccak256("impl"))
            .value
            .delegatecall(msg.data);
        require(success);
    }

    // function changeX(uint _x) external {
    //     Logic1(implementation).changeX(_x);
    // }
}

contract Logic1 {
    mapping(address => uint) balances;
    uint x = 0;

    function changeX(uint _x) external {
        x = _x;
    }
}

contract Logic2 {
    uint x = 0;

    function changeX(uint _x) external {
        x = _x * 2;
    }

    function tripleX() external {
        x *= 3;
    }
}
