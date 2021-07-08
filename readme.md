Chạy một local chain với chain id là 100 bằng lệnh:

```ganache-cli -i 100```

Compile và Migration testnet

```yarn install```

```config private key mnemonic in ./file truffle-config.js```

```truffle compile```

```truffle migrate --network testnet```

if every update:  ```truffle migrate --network testnet --reset```


Check: https://testnet.bscscan.com/address/0xA56Cb9B4242bAf56fd028b0eC8f24a9F4c0525e6

Docs verify: https://docs.binance.org/smart-chain/developer/deploy/truffle-verify.html
