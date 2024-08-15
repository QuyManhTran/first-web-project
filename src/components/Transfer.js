import React from "react";

export function Transfer({ transferTokens, tokenSymbol, depositTokens }) {
    return (
        <div>
            <h4>Minting</h4>
            <form
                onSubmit={(event) => {
                    // This function just calls the transferTokens callback with the
                    // form's data.
                    event.preventDefault();

                    const formData = new FormData(event.target);
                    const amount = formData.get("amount");

                    if (amount) {
                        transferTokens(amount);
                    }
                }}
            >
                <div className="form-group">
                    <label>Amount of {tokenSymbol}</label>
                    <input
                        className="form-control"
                        type="number"
                        step="1"
                        name="amount"
                        placeholder="1"
                        required
                    />
                </div>
                <div className="form-group">
                    <input
                        className="btn btn-primary btn-lg"
                        type="submit"
                        value="Mint"
                    />
                </div>
            </form>
            <form
                onSubmit={(event) => {
                    // This function just calls the transferTokens callback with the
                    // form's data.
                    event.preventDefault();

                    const formData = new FormData(event.target);
                    const amount = formData.get("deposit");

                    if (amount) {
                        depositTokens(amount);
                    }
                }}
            >
                <div className="form-group">
                    <label>Amount of {tokenSymbol}</label>
                    <input
                        className="form-control"
                        type="number"
                        step="1"
                        name="deposit"
                        placeholder="1"
                        required
                    />
                </div>
                <div className="form-group">
                    <input
                        className="btn btn-primary btn-lg"
                        type="submit"
                        value="Deposit"
                    />
                </div>
            </form>
        </div>
    );
}
