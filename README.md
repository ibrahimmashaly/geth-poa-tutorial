_This tutorial is based on [this Hackernoon Tutorial](https://hackernoon.com/setup-your-own-private-proof-of-authority-ethereum-network-with-geth-9a0a3750cda8) from Salanfe_

# What is Proof of Authority (PoA)? 


[Proof-of-Authority](https://wiki.parity.io/Proof-of-Authority-Chains) is a consensus mechanism used as an alternative to Proof of Work. Where Proof of Work relies on miners expending computing power in a race to create the next block and secure the blockchain, Proof of Authority designates this role to a number of "authority" nodes. In a typical Proof of Authority ruled network, one node is designated as a producer of blocks and the rest vote on the legitimacy of that block.

Proof-of-Authority (PoA) is an easier way to run a blockchain with semi-trusted participants, such as a consortium blockchain. Designated signers create the possibility of a small, secure blockchain not worried about [51% attacks endemic to Proof-of-Work secured blockchains.](https://www.investopedia.com/terms/1/51-attack.asp) PoA also comes with transaction finality, so a new node syncing to the PoA network only has to obtain the latest block to know the state of the network. However, PoA-backed network have their own series of security issues (which are outside the scope of this tutorial).

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
   * [Transactions](#transactions)
   * [Cleaning up the Network](#cleaning-up-the-network)
   * [Further-Reading](#further-reading)
<!--te-->

Project Setup
============

We are assuming you have already downloaded the Go-Ethereum client `geth`. If you have not, [installation instructions are here.](https://github.com/ethereum/go-ethereum/wiki/Building-Ethereum)

_Note: This tutorial was created using `geth 1.8.14`_

If you would like to create a new series of accounts, you'll need to install the `expect` package , [Homebrew (Mac) installation instructions are here](http://brewformulas.org/Expect)


Clique
============
`geth` now comes with a native Proof-of-Authority protocol called `Clique`. It creates a genesis block detailing the important specifications of a Proof-of-Authority network. These include:

* Who are the valid signers of blocks in this network?
* Which accounts are pre-funded in this network?
* How often will a block be broadcast by valid signers?

Clique has an important security feature. Any signer can only produce a certain number of consecutive blocks. That number is contingent on the number of total number of signers encoded in the genesis block. The equation for that number is `CONSECUTIVE_BLOCK_LIMIT = (NUMBER_OF_TOTAL_SIGNERS / 2) + 1`

For example, if there are four nodes designated as signers in the genesis block, one of those signers can only broadcast `(4 / 2) + 1 = 3` blocks before the network will refuse any more blocks confirmed by that node. Only until another one of the four designated signers confirms a block can the original node resume submitting.

This creates a mild safeguard against a rogue node overtaking a network and maliciously altering the network state. It also, however, can freeze your network if not enough valid signers are online.

**Fun Fact: The Rinkeby testnet runs using Clique-generated Proof-of-Authority.**

_For more information about Clique, please read [this Github issue from Péter Szilágyi explaining its release.](https://github.com/ethereum/EIPs/issues/225)_


Configuring Clique via Puppeth
============

`geth` includes the handy module `puppeth` for creating custom genesis blocks. We have scripted that process here but will walk through what `puppeth` is doing under-the-hood.

[(Click here to skip ahead)](#starting-the-network)

### Network Name

![Network-Name](/images/puppeth-1.png)

For local caching purposes, `puppeth` asks you for a network name. If it detects this network has been used before, it will pull the network information it has previously stored.

Be sure not to use any spaces or hyphens!


### Configure New Genesis

![New-Genesis](/images/puppeth-2.png)

We're getting a new genesis block started, so we're going to select `2`

### Clique Consensus Mechanism

![Consensus](/images/puppeth-3.png)

Ethereum Mainnet currently runs on [Proof-of-Work consensus.](https://cointelegraph.com/explained/proof-of-work-explained) That's an awesome consensus mechanism for large networks sprawling the globle in a trustless manner, but for our small, down-home network, we're going to choose Clique, [a Proof-of-Authority consensus mechanism.](https://en.wikipedia.org/wiki/Proof-of-authority)

### Block Time

![Block Time](/images/puppeth-4.png)

In blockchain networks, the block time is considered the "network heartbeat" -- how often a confirmed block containing the latest confirmed transactions is broadcast out to the network.

In Proof-of-Work, this time is moderated by a complex algorithm which has a target network time (~10m for Bitcoin, ~14s for Ethereum) and adjusts variables according to the current capacity of miners on the network.

In Proof-of-Authority, we don't need that complicated algorithm but we do need a set time to run an orderly network. Since Ethereum's block time is 12-14 seconds, we'll put our network's block time at 7s. 

Proof-of-Authority networks can decrease their block time and therefore increase their transaction throughput (the number of transactions processed per second). This is a desirable goal for certain blockchain use cases.

### Sealer Nodes

![Sealer Nodes](/images/puppeth-5.png)

As discussed above, Proof-of-Authority networks allow only certain nodes, called "sealers" to confirm blocks in the network. Furthermore, the Clique consensus protocol only allows each sealer to confirm a certain number of consecutive blocks. For the sake of demonstrating Proof-of-Authority networks, we'll just put one here for simplicity's sake.

_Note: The `0x` prefix help program parsers know whatever follows it as a hexadecimal-encoded value. Read more [here](https://stackoverflow.com/questions/2670639/why-are-hexadecimal-numbers-prefixed-with-0x)_

### Pre-Funded Nodes

![Pre-Funded Nodes](/images/puppeth-6.png)

Cryptocurrency units can be created one of two ways. First, someone can mine new blocks for a network and be rewarded in that cryptocurrency. Second, the creator of a network can designate certain accounts to have a certain balance in the genesis block (also known as a "pre-mine").

Here, we are designating which nodes will be "pre-funded" in the genesis block. What  generous folks we are!

### Network ID

![Network ID](/images/puppeth-7.png)

Nodes on a network need to determine which nodes they can connect with. With a custom-generated genesis block, we provide a `Network ID` so nodes can easily identify each other.

`1515` we are choosing randomly, you can pick any number you'd like.

After we enter `Network ID`, `puppeth` takes all the information we have provided it and creates a custom genesis block for our Proof-of-Authority network.

### Exporting Genesis Block

![Exporting Genesis Block](/images/puppeth-8.png)

Last, we need to export the genesis block `puppeth` has created for us. Provide a filename here (and be sure to add `.json` to the end!) or simply hit enter to accept the detault name.

Starting the Network
============

## Launching the Bootnode

## Launching Node 1

## Launching Node 2

## Launching Node 3

Transactions
============

## Opening `geth` REPL console

## Locating account names

## Constructing and Sending Transactions

Cleaning up the Network
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
