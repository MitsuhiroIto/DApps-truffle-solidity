var abi = [
  {
    "constant": true,
      "inputs": [],
      "name": "get",
      "outputs": [
        {
          "name": "",
          "type": "string"
        }
      ],
      "payable": false,
      "stateMutability": "pure",
      "type": "function"
  }
];
var address = "0xb66a3903db3258cd8ae3c0d107220c1c0ceb19df"; // コントラクトアドレス
 
window.onload = function() {
  var contract = web3.eth.contract(abi).at(address);
  contract.get((error, result) => {
    document.getElementById("contract_result").textContent = result;
  });
};