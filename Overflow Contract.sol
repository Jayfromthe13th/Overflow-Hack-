pragma solidity 0.4.10;
contract Overflow{
    mapping (address=>uint) balances;
    //can send ether 
    function contribute()  payable{
        
        balances[msg.sender] = msg.value;
    }

    function getBalance() constant returns (uint) {
        return balances[msg.sender];
    }

    function batchSend(address[] _recievers, uint _value){
        // this line overflows
        uint total = _recievers.length * _value;
        require(balances[msg.sender] >= total);
        balances[msg.sender] = balances[msg.sender] - total;
        
    for(uint i = 0; i < _recievers.length; i++){

    balances[_recievers[i]] = balances[_recievers[i]] + _value;
        }
    }
}
