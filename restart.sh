#!/bin/bash
# Removes files created by flow.sh

find . -type f -name "*.zip" -exec rm {} \;
find . -type d -name "node*" -exec rm -rf {} \; || true
rm poa-genesis.json