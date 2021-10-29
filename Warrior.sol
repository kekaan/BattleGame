pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import 'Unit.sol';

contract Warrior is Unit {

    constructor(BaseStation.Base base) public checkOwnerAndAccept {
        baseAddr = base;
        base.addUnit("Warrior");
        attackPower = 3;
        protectionPower = 2;
    }
}
