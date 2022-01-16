

export class WalletAdaptorPhantom {
	constructor() {
        if(!window.solana.isConnected) throw new Error("Connect to Phantom first");
        return;
		this.publicKey = window.solana.publicKey;
	}

	async signTransaction(tx) {
		const signedTransaction = await window.solana.signTransaction(tx);
		return signedTransaction;
	}

	async signAllTransactions(txs) {
		const signedTransactions = await window.solana.signAllTransactions(transactions);
		return signedTransactions;
	}

	get publicKey() {
		return window.solana.publicKey;
	}
}
