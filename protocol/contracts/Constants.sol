/*
    Copyright 2020 Dynamic Dollar Devs, based on the works of the Empty Set Squad

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/

pragma solidity ^0.5.17;
pragma experimental ABIEncoderV2;

import "./external/Decimal.sol";

library Constants {
    /* Chain */
    uint256 private constant CHAIN_ID = 1; // Mainnet

    /* Bootstrapping */
    uint256 private constant BOOTSTRAPPING_PERIOD = 15000; // 15000 epochs
    uint256 private constant BOOTSTRAPPING_PRICE = 154e16; // 1.54 BUSD

    /* Oracle */
    address private constant BUSD = address(0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56);
    uint256 private constant ORACLE_RESERVE_MINIMUM = 1e10; // 10,000 BUSD

    /* Bonding */
    uint256 private constant INITIAL_STAKE_MULTIPLE = 1e6; // 100 VSD -> 100M VSDS

    /* Epoch */
    struct EpochStrategy {
        uint256 offset;
        uint256 start;
        uint256 period;
    }

    uint256 private constant EPOCH_OFFSET = 0;
    uint256 private constant EPOCH_START = 1614022808;
    uint256 private constant EPOCH_PERIOD = 60;

    /* Governance */
    uint256 private constant GOVERNANCE_PERIOD = 3600;
    uint256 private constant GOVERNANCE_QUORUM = 5e16; // 5%
    uint256 private constant GOVERNANCE_PROPOSAL_THRESHOLD = 5e15; // 0.5%
    uint256 private constant GOVERNANCE_SUPER_MAJORITY = 66e16; // 66%
    uint256 private constant GOVERNANCE_EMERGENCY_DELAY = 600; // 600 epochs

    /* DAO */
    uint256 private constant ADVANCE_INCENTIVE = 15e17; // 0.15 VSD
    uint256 private constant DAO_EXIT_LOCKUP_EPOCHS = 360; // 36 epochs fluid

    /* Pool */
    uint256 private constant POOL_EXIT_LOCKUP_EPOCHS = 120; // 12 epochs fluid

    /* Market */
    uint256 private constant COUPON_EXPIRATION = 9999999999;
    uint256 private constant DEBT_RATIO_CAP = 35e20; // 350000%
    uint256 private constant INITIAL_COUPON_REDEMPTION_PENALTY = 100e16; // 100%
    uint256 private constant COUPON_REDEMPTION_PENALTY_DECAY = 30; // 30 seconds

    /* Regulator */
    uint256 private constant SUPPLY_CHANGE_LIMIT = 10e17; // 100%
    uint256 private constant SUPPLY_CHANGE_DIVISOR = 25e20; // 2500 > Max expansion at 1.5
    uint256 private constant COUPON_SUPPLY_CHANGE_LIMIT = 10e17; // 100%
    uint256 private constant COUPON_SUPPLY_CHANGE_DIVISOR = 1666e18; // 1666 > Max expansion at ~1.5
    uint256 private constant NEGATIVE_SUPPLY_CHANGE_DIVISOR = 5e20; // 500 > Max negative expansion at 0.9
    uint256 private constant ORACLE_POOL_RATIO = 40; // 40%
    uint256 private constant TREASURY_RATIO = 3; // 3%

    /* Deployed */
    address private constant DAO_ADDRESS = address(0x6Bf977ED1A09214E6209F4EA5f525261f1A2690a);
    address private constant DOLLAR_ADDRESS = address(0xBD2F0Cd039E0BFcf88901C98c0bFAc5ab27566e3);
    address private constant PAIR_ADDRESS = address(0x66e33d2605c5fB25eBb7cd7528E7997b0afA55E8);
    address private constant TREASURY_ADDRESS = address(0xC7DA8087b8BA11f0892f1B0BFacfD44C116B303e);

    /**
     * Getters
     */
    function getBusdAddress() internal pure returns (address) {
        return BUSD;
    }

    function getOracleReserveMinimum() internal pure returns (uint256) {
        return ORACLE_RESERVE_MINIMUM;
    }

    function getEpochStrategy() internal pure returns (EpochStrategy memory) {
        return EpochStrategy({
            offset: EPOCH_OFFSET,
            start: EPOCH_START,
            period: EPOCH_PERIOD
        });
    }

    function getInitialStakeMultiple() internal pure returns (uint256) {
        return INITIAL_STAKE_MULTIPLE;
    }

    function getBootstrappingPeriod() internal pure returns (uint256) {
        return BOOTSTRAPPING_PERIOD;
    }

    function getBootstrappingPrice() internal pure returns (Decimal.D256 memory) {
        return Decimal.D256({value: BOOTSTRAPPING_PRICE});
    }

    function getGovernancePeriod() internal pure returns (uint256) {
        return GOVERNANCE_PERIOD;
    }

    function getGovernanceQuorum() internal pure returns (Decimal.D256 memory) {
        return Decimal.D256({value: GOVERNANCE_QUORUM});
    }

    function getGovernanceProposalThreshold() internal pure returns (Decimal.D256 memory) {
        return Decimal.D256({value: GOVERNANCE_PROPOSAL_THRESHOLD});
    }

    function getGovernanceSuperMajority() internal pure returns (Decimal.D256 memory) {
        return Decimal.D256({value: GOVERNANCE_SUPER_MAJORITY});
    }

    function getGovernanceEmergencyDelay() internal pure returns (uint256) {
        return GOVERNANCE_EMERGENCY_DELAY;
    }

    function getAdvanceIncentive() internal pure returns (uint256) {
        return ADVANCE_INCENTIVE;
    }

    function getDAOExitLockupEpochs() internal pure returns (uint256) {
        return DAO_EXIT_LOCKUP_EPOCHS;
    }

    function getPoolExitLockupEpochs() internal pure returns (uint256) {
        return POOL_EXIT_LOCKUP_EPOCHS;
    }

    function getCouponExpiration() internal pure returns (uint256) {
        return COUPON_EXPIRATION;
    }

    function getDebtRatioCap() internal pure returns (Decimal.D256 memory) {
        return Decimal.D256({value: DEBT_RATIO_CAP});
    }
    
    function getInitialCouponRedemptionPenalty() internal pure returns (Decimal.D256 memory) {
        return Decimal.D256({value: INITIAL_COUPON_REDEMPTION_PENALTY});
    }

    function getCouponRedemptionPenaltyDecay() internal pure returns (uint256) {
        return COUPON_REDEMPTION_PENALTY_DECAY;
    }

    function getSupplyChangeLimit() internal pure returns (Decimal.D256 memory) {
        return Decimal.D256({value: SUPPLY_CHANGE_LIMIT});
    }

    function getSupplyChangeDivisor() internal pure returns (Decimal.D256 memory) {
        return Decimal.D256({value: SUPPLY_CHANGE_DIVISOR});
    }

    function getCouponSupplyChangeLimit() internal pure returns (Decimal.D256 memory) {
        return Decimal.D256({value: COUPON_SUPPLY_CHANGE_LIMIT});
    }

    function getCouponSupplyChangeDivisor() internal pure returns (Decimal.D256 memory) {
        return Decimal.D256({value: COUPON_SUPPLY_CHANGE_DIVISOR});
    }

    function getNegativeSupplyChangeDivisor() internal pure returns (Decimal.D256 memory) {
        return Decimal.D256({value: NEGATIVE_SUPPLY_CHANGE_DIVISOR});
    }

    function getOraclePoolRatio() internal pure returns (uint256) {
        return ORACLE_POOL_RATIO;
    }

    function getTreasuryRatio() internal pure returns (uint256) {
        return TREASURY_RATIO;
    }

    function getChainId() internal pure returns (uint256) {
        return CHAIN_ID;
    }

    function getDaoAddress() internal pure returns (address) {
        return DAO_ADDRESS;
    }

    function getDollarAddress() internal pure returns (address) {
        return DOLLAR_ADDRESS;
    }

    function getPairAddress() internal pure returns (address) {
        return PAIR_ADDRESS;
    }

    function getTreasuryAddress() internal pure returns (address) {
        return TREASURY_ADDRESS;
    }
}
