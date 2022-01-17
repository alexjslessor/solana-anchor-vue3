#!/bin/bash

# Anchor.toml: Anchor configuration file.
# Cargo.toml: Rust workspace configuration file.
# package.json: JavaScript dependencies file.
# programs/: Directory for Solana program crates.
# app/: Directory for your application frontend.
# tests/: Directory for JavaScript integration tests.
# migrations/deploy.js: Deploy script.

# INFO:
# vars
program=/home/hauwei/Dropbox/APPS/solana-1/anc1/target/deploy/anc1.so
program_id=6r2DZtptqFkwS1UXPDFioKb8itkaEf6DH4e9pWJdYrLc
key_pair=~/.config/solana/id.json
# program_key_pair=target/deploy/anc1-keypair.json

which_net=https://api.devnet.solana.com
# ensure wallet has coin
addr_1=$(solana-keygen pubkey $key_pair)
solana airdrop 2 $addr_1 --url $which_net
addr_1_bal=$(solana balance $addr_1 --url $which_net)
echo "wallet balance: $addr_1_bal"
# show config
# anchor cluster list
solana config get keypair
solana config get
solana address -k ./target/deploy/anc1-keypair.json
echo '----------------------------------------========'

# Prereqs:
# solana config set --url $which_net

# BUILD AND DEPLOY
# anchor build
# DEPLOY
# anchor deploy
# or
# COPY IDL INTO FRONTEND APP; do this every deploy
# cp -r ./target/idl ./app/src


# UPDATE
# anchor upgrade $program --program-id $program_id
# anchor verify $program_id
