var Web3 = require('web3');
var web3 = new Web3(new Web3.providers.HttpProvider('http://localhost:7545'));

let contractAddress = '0xb66a3903db3258cd8ae3c0d107220c1c0ceb19df'
let index = 1

const oraclePromises = [
  web3.eth.getStorageAt(contractAddress, index)
]

Promise.all(oraclePromises)
.then((result) => {
  console.log(result[0]);
  console.log(web3.utils.toDecimal(result[0]));
  
})
