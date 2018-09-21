# What is Proof of Authority (PoA)? 


[Proof of Authority](https://wiki.parity.io/Proof-of-Authority-Chains) is a consensus mechanism used as an alternative to Proof of Work. Where Proof of Work relies on miners expending computing power in a race to create the next block and secure the blockchain, Proof of Authority designates this role to a number of "authority" nodes. In a typical Proof of Authority ruled network, one node is designated as a producer of blocks and the rest vote on the legitimacy of that block.


**Note: It is not suggested that you use this tutorial PoA network created for anything other than educational purposes. For secure PoA networks, see [Further Reading](#further-reading) section below**


**Objectives:**
1. To understand how a Proof of Authority consensus algorithm works.
2. Learn to implement a PoA using `Geth`'s Clique module
3. Run and conduct transactions on the PoA network

Table of contents
=================
<!--ts-->
   * [Project Setup](#project-setup)
   * [Running Clique](#implementing-the-contract)
   * [Starting the Network](#starting-the-network)
   * [Extra Credit](#extra-credit)
   * [Further-Reading](#further-reading)
<!--te-->

Project Setup
============

First, download the Go-Ethereum client `geth`

Install for Mac (via [ethereum/go-ethereum](https://github.com/ethereum/go-ethereum/wiki/Installation-Instructions-for-Mac))
==========

By far the easiest way to install go-ethereum is to use our Homebrew tap. If you don't have Homebrew, [install it first](http://brew.sh/).

Then run the following commands to add the tap and install geth:

```
brew tap ethereum/ethereum
brew install ethereum
```

After installing, run `geth account new` to create an account on your node.



Running Clique
============

Starting the Network
============

Extra Credit
============

Further Reading
============
https://hackernoon.com/setup-your-own-private-proof-of-authority-ethereum-network-with-geth-9a0a3750cda8
https://wiki.parity.io/Proof-of-Authority-Chains
https://wiki.parity.io/Demo-PoA-tutorial.html

https://wiki.parity.io/Proof-of-Authority-Chains
https://github.com/ethereum/EIPs/issues/225
https://github.com/f-o-a-m/cliquebait
