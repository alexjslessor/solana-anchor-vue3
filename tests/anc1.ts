import * as anchor from '@project-serum/anchor';
import { Program } from '@project-serum/anchor';
import { Anc1 } from '../target/types/anc1';

describe('anc1', () => {

  // Configure the client to use the local cluster.
  anchor.setProvider(anchor.Provider.env());

  const program = anchor.workspace.Anc1 as Program<Anc1>;

  it('Is initialized!', async () => {
    // Add your test here.
    const tx = await program.rpc.initialize({});
    console.log("Your transaction signature", tx);
  });
});
