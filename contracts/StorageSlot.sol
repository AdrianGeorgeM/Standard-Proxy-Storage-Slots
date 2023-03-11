// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

library StorageSlot {
    struct AddressSlot {
        address value;
    }

    struct BooleanSlot {
        bool value;
    }

    struct Bytes256Slot {
        bytes32 value;
    }
    struct Uint256Slot {
        uint256 value;
    }

    function getAddressSlot(
        bytes32 _slot
    ) internal pure returns (AddressSlot storage slot) {
        assembly {
            slot.slot := _slot
        }
    }

    function getBooleanSlot(
        bytes32 _slot
    ) internal pure returns (BooleanSlot storage slot) {
        assembly {
            slot.slot := _slot
        }
    }

    function getBytes256Slot(
        bytes32 _slot
    ) internal pure returns (Bytes256Slot storage slot) {
        assembly {
            slot.slot := _slot
        }
    }
}
