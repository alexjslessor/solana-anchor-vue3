
![sic semper tyrannis](./spacescape_8.png)

# Overview:

First attempt at solana blockchain development using the very new __anchor__ framework.

Anchor handles data serialization/de-serialization between the rust backend and frontend of your choice (probably javascript).

Project file overview. 
```
Anchor.toml: Anchor configuration file.
Cargo.toml: Rust workspace configuration file.
package.json: JavaScript dependencies file.
programs/: Directory for Solana program crates.
app/: Directory for your application frontend.
tests/: Directory for JavaScript integration tests.
migrations/deploy.js: Deploy script.
```

# Setup:

__BUILD AND DEPLOY:__

Step 1: __Build you backend__
```bash
anchor build
solana address -k ./target/deploy/anc1-keypair.json
6r2DZtptqFkwS1UXPDFioKb8itkaEf6DH4e9pWJdYrLc
```

Step2: COPY idl to frontend after building. This is the entry point to allow your frontend to communicate with your rust/anchor backend.
```bash
cp -r ./target/idl ./app/src
```

To view your deployed program select your net and enter programId.

https://explorer.solana.com/address/6r2DZtptqFkwS1UXPDFioKb8itkaEf6DH4e9pWJdYrLc?cluster=devnet


# Notes:

Docs:

https://docs.rs/anchor-lang/latest/anchor_lang/#

https://project-serum.github.io/anchor/getting-started/introduction.html


Ensure your keypair has been included in the appropriate places throughout your app.
```bash
solana address -k ./target/deploy/anc1-keypair.json
```

Ensure you are using the correct network.
```bash
solana config set --url http://localhost:8899
```

Change cluster to deploy compiled app to which net you want.

To see the nets run `anchor cluster list`

Set appropriate cluster `solana config set --url http://localhost:8899`

~/Anchor.toml
```ini
[provider]
cluster = "devnet"
or
cluster = "localhost"
wallet = "/home/hauwei/.config/solana/id.json"
```


# Dependencies:

__Frontend:__
```bash
yarn add @project-serum/anchor
```


