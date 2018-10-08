#!/bin/bash
ACCOUNTS=()
# TEST=('BB9bc244D798123fDe783fCc1C72d3Bb8C189413' '795ac833df259150315a9126c2fcce36096b1548' '4fed1fc4144c223ae3c1553be203cdfcbd38c581' 'aea6edcde9206a8c7f3e0505aab566e5e2f3085b')

echo "Positional argument $1 exists"

# ACCOUNTS+=('BB9bc244D798123fDe783fCc1C72d3Bb8C189413')
# ACCOUNTS+=('795ac833df259150315a9126c2fcce36096b1548')
# ACCOUNTS+=('4fed1fc4144c223ae3c1553be203cdfcbd38c581')

# echo ${ACCOUNTS[@]} > "poa-accounts.txt"


# num_accounts=3

# # for ((i=1; i<=$((num_accoiunts));i++)); do
            
# #     ## Setup new account in geth
# #     cp -R poa-test-genesis.json "node$i"
# #     # echo $ACCOUNTS
# #     ## Find account number and add to list
# #     zip "node$i.zip" "node$i/"
# #     sleep .5
# # done

# expect -f test.expect $num_accounts ${ACCOUNTS[@]}


# # num_users=3
# # counter=1
# # test_accounts+=('795ac833df259150315a9126c2fcce36096b1548')
# # test_accounts+=('4fed1fc4144c223ae3c1553be203cdfcbd38c581')
# # test_accounts+=('aea6edcde9206a8c7f3e0505aab566e5e2f3085b')
# # echo "$test_accounts"
# # j=0


# # expect <<EOF
# #     # set index 0
# #     # if {$counter == 1} {
# #     #     puts "$((counter))"
# #     #     puts ${test_accounts[$((counter))]}
# #     #     set index [expr {$index+1}]
# #     # }
# #     # set i 0
# #     # puts "[llength $test_accounts[@]]"
# #     foreach {x} "$test_accounts" {
# #         puts "$((x))"
# #     }

# #     # lindex $test_accounts 1 2 3
# #     while { "$i" < 10 } {
# #     puts "I inside first loop: $((i))"
# #     set i { expr $i + 1 }

# # }
#     spawn puppeth
#     expect "please)"
#     send "name30\r"
#     expect "stats)"
#     send "2\r"
#     expect "clique)"
#     send "2\r"
#     expect "15)"
#     send "5\r"
#     expect "one)"
#     send "BB9bc244D798123fDe783fCc1C72d3Bb8C189413\r"
#     expect "0x"
#     send "\r"
#     expect "one)"
#     send "BB9bc244D798123fDe783fCc1C72d3Bb8C189413\r"
#     expect "0x"
#     send "\r"
#     expect "random)"
#     send "1515\r"
#     expect "stats)"
#     send "2\r"
#     sleep .5
#     send "2\r"
#     sleep .5
#     send "poa-test-genesis.json\r"
# EOF