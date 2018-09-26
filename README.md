_This tutorial is based on [this Hackernoon Tutorial](https://hackernoon.com/setup-your-own-private-proof-of-authority-ethereum-network-with-geth-9a0a3750cda8) from Salanfe_

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
   * [Configuring Clique via Puppeth](#configuring-clique-via-puppeth)
   * [Starting the Network](#starting-the-network)
   * [Private Transactions](#private-transactions)
   * [Further-Reading](#further-reading)
<!--te-->

Project Setup
============

We are assuming you have already downloaded the Go-Ethereum client `geth`. If you do not, [installation instructions are here.](https://github.com/ethereum/go-ethereum/wiki/Building-Ethereum)



Configuring Clique via Puppeth
============

Starting the Network
============

Private Transactions
============

Further Reading
============
https://hackernoon.com/setup-your-own-private-proof-of-authority-ethereum-network-with-geth-9a0a3750cda8
https://wiki.parity.io/Proof-of-Authority-Chains
https://wiki.parity.io/Demo-PoA-tutorial.html
https://medium.com/@collin.cusce/using-puppeth-to-manually-create-an-ethereum-proof-of-authority-clique-network-on-aws-ae0d7c906cce

https://wiki.parity.io/Proof-of-Authority-Chains
https://github.com/ethereum/EIPs/issues/225
https://github.com/f-o-a-m/cliquebait
