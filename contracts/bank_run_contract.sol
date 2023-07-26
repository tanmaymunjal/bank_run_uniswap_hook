// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Hooks} from "https://github.com/Uniswap/v4-core/blob/main/contracts/libraries/Hooks.sol";
import {BaseHook} from "contracts/base_hook.sol";
import {PoolId, PoolIdLibrary} from "https://github.com/Uniswap/v4-core/blob/main/contracts/types/PoolId.sol";
import {PoolKey} from "https://github.com/Uniswap/v4-core/blob/main/contracts/types/PoolKey.sol";
import {IPoolManager} from "https://github.com/Uniswap/v4-core/blob/main/contracts/interfaces/IPoolManager.sol";

contract BankRunHook is BaseHook{
    using PoolIdLibrary for PoolKey;

    constructor(IPoolManager _poolManager) BaseHook(_poolManager) {}

    function getHooksCalls() public pure override returns (Hooks.Calls memory) {
        return Hooks.Calls({
            beforeInitialize: false,
            afterInitialize: false,
            beforeModifyPosition: true,
            afterModifyPosition: true,
            beforeSwap: true,
            afterSwap: true,
            beforeDonate: false,
            afterDonate: false
        });
    }
}