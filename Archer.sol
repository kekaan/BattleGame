pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import 'Unit.sol';

contract Archer is Unit{

    constructor(BaseStation.Base base) public checkOwnerAndAccept {
        baseAddr = base;
        base.addUnit("Archer");
        attackPower = 3;
        protectionPower = 1;        
    }
}
