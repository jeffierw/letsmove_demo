const { NAVISDKClient } = require('navi-sdk')
const { TransactionBlock } = require("@mysten/sui.js/transactions");
const {
  Sui,
  pool
} = require('navi-sdk/dist/address');
const {
  depositCoin,
  SignAndSubmitTXB
} = require('navi-sdk/dist/libs/PTB/index');


const mnemonic = "";
const client = new NAVISDKClient({mnemonic: mnemonic, networkType: "mainnet", numberOfAccounts: 1});

// 初始化TXB
let txb = new TransactionBlock();
const account = client.accounts[0];
let sender = account.address;
console.log("=================",sender,account, txb.gas, client.accounts)
txb.setSender(sender);

const amount_to_supply = 1e9; // 存1个Sui
const [to_deposit] = txb.splitCoins(txb.gas, [amount_to_supply]); // 分割存储的Sui
const Sui_Pool = pool[Sui.symbol]; // 获取Sui流动池对象
depositCoin(txb, Sui_Pool, to_deposit, amount_to_supply);

try {
  const res = await SignAndSubmitTXB(txb, account.client, account.keypair) // 签名并提交TXB
  console.log('res', res);
} catch (error) {
  console.log(error);
}

