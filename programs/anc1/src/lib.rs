use anchor_lang::prelude::*;
use std::str::from_utf8;

declare_id!("6r2DZtptqFkwS1UXPDFioKb8itkaEf6DH4e9pWJdYrLc");

#[program]
pub mod anc1 {
    use super::*;
    pub fn initialize(ctx: Context<Initialize>) -> ProgramResult {
        // ctx.accounts.authority.
        let blog_acct = &mut ctx.accounts.blog_account;
        blog_acct.authority = *ctx.accounts.authority.key;
        Ok(())
    }

    pub fn make_post(
        ctx: Context<MakePost>,
        new_post: Vec<u8>, // <--- our blog post data
    ) -> ProgramResult {
        
        let memo = from_utf8(&new_post)
        .map_err(|err| {
            msg!("Invalid UTF-8, from byte {}", err.valid_up_to());
            ProgramError::InvalidInstructionData
        })?;
        // msg!() is a Solana macro that prints string slices to the program log, 
        // which we can grab from the transaction block data
        msg!(memo);
        let blog_acct = &mut ctx.accounts.blog_account;
        blog_acct.latest_post = new_post; // save the latest post in the account.
        // past posts will be saved in transaction logs
        Ok(())
    }
}

#[derive(Accounts)]
pub struct Initialize<'info> {
    #[account(
        init, // 1. Hey Anchor, initialize an account with these details for me
        payer = authority, // 2. See that authority Signer (pubkey) down there? They're paying for this
        space = 8 // 3.A) all accounts need 8 bytes for the account discriminator prepended to the account
        + 32 // 3.B) authority: Pubkey needs 32 bytes
        + 566 // 3.C) latest_post: post bytes could need up to 566 bytes for the memo; You have to do this math yourself, there's no macro for this
    )]
    pub blog_account: Account<'info, BlogAccount>, // 1. <--- initialize this account variable & add it to Context.accounts.blog_account can now be used above in our initialize function
    pub authority: Signer<'info>, // 5. <--- let's name the account that signs this transaction "authority" and make it mutable so we can set the value to it in `initialize` function above
    pub system_program: Program<'info, System>, // <--- Anchor boilerplate
}

#[derive(Accounts)]
pub struct MakePost<'info> {
    #[account(
        mut, 
        has_one = authority
    )]
    pub blog_account: Account<'info, BlogAccount>,
    pub authority: Signer<'info>
}



#[account]
pub struct BlogAccount {
    pub latest_post: Vec<u8>,
    pub authority: Pubkey
}
