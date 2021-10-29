pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import 'GameObject.sol';
import 'Base.sol' as BaseStation;

abstract contract Unit is GameObject{

    address baseAddr;
    int attackPower;

    function getAttackPower() public checkOwnerAndAccept() returns(int){
        return attackPower;
    }

    function attack(address enemy) public checkOwnerAndAccept() {
        IGameObject(enemy).takeDamage(attackPower);
    }

    function deathTreatment(address dest) internal override{
        selfdestruct(dest);
        BaseStation.Base(baseAddr).deleteUnit();           
    }

    function deathByBase(address dest) external {
        require(baseAddr == msg.sender, 103, "This Unit doesn't belong to your Base");
        tvm.accept();
        deathTreatment(dest);
    }
}
