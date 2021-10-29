pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import 'IGameObject.sol';

contract GameObject is IGameObject {

    int health = 5;
    int protectionPower = 1;

    modifier checkOwnerAndAccept() {
        require(msg.pubkey() == tvm.pubkey(), 102, "checkOwnerAndAcceptError");
		tvm.accept();
		_;     
    }

    function getHealth() public checkOwnerAndAccept() returns (int){
        return health;
    }

    function getProtectionPower() public checkOwnerAndAccept() returns (int){
        return protectionPower;
    }

    function isDied() internal view returns(bool) {
        if(health <= 0)
            return true;
        else return false;
    }

    function deathTreatment(address dest) internal virtual {
        selfdestruct(dest);
    }

    function takeDamage(int damage) external override {
        health = health - damage + protectionPower;
        if (isDied())
            deathTreatment(msg.sender);
    } 
}
