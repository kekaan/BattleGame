pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

interface IGameObject {
    function takeDamage(int value) external;
}
