pragma solidity ^0.4.4;
 
contract HelloWorld {
 
  string public word;
 
  event Set(address sender, string newWord);
 
  function HelloWorld() public {
    word = "Hello World!";
  }
 
  function get() public view returns (string) {
    return word;
  }
 
  function set(string newWord) public {
    word = newWord;
    Set(msg.sender, newWord);
  }
}