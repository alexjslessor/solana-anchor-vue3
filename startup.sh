#!/bin/bash

# key_pair=~/.config/solana/id.json

# anchor cluster list

# https://project-serum.github.io/anchor/cli/commands.html#init

# Anchor.toml: Anchor configuration file.
# Cargo.toml: Rust workspace configuration file.
# package.json: JavaScript dependencies file.
# programs/: Directory for Solana program crates.
# app/: Directory for your application frontend.
# tests/: Directory for JavaScript integration tests.
# migrations/deploy.js: Deploy script.


# BUILD AND DEPLOY
# anchor build
# solana address -k ./target/deploy/anc1-keypair.json
# 6r2DZtptqFkwS1UXPDFioKb8itkaEf6DH4e9pWJdYrLc

# solana config set --url http://localhost:8899
# anchor deploy

# or
# solana config get keypair
# COPY IDL INTO FRONTEND APP; do this every deploy
cp -r ./target/idl ./app/src



# solana program show <ACCOUNT_ADDRESS>
# solana program show 6spdBdoZEixbftCSgPvixbEYvnkYdYcAydxob5MEdcha
