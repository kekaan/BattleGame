pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import 'GameObject.sol';
import 'Unit.sol';

contract Base is GameObject{

    mapping(address => string) units;

    function addUnit(string unitType) external {
        units[msg.sender] = unitType;
    }

    function deleteUnit() external {
        delete units[msg.sender];
    }

    function getAllUnits() public checkOwnerAndAccept returns (mapping (address=>string)) {
        return units;
    }
    

    function deathTreatment(address dest) internal override {
        selfdestruct(dest);
        optional(address, string) currentOpt = units.min();
        while (currentOpt.hasValue()){
            (address addr, string unitType) = currentOpt.get();
            Unit(addr).deathByBase(dest);
            currentOpt = units.next(addr);
        }
    }
}