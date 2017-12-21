#!/bin/sh
set -e

if [ "$1" = 'monero-wallet-cli' -o "$1" = 'monero-wallet-rpc' -o "$1" = 'monerod' ]; then
	mkdir -p "$MONERO_DATA"

	if [ ! -s "$MONERO_DATA/bitmonero.conf" ]; then
		cat <<-EOF > "$MONERO_DATA/bitmonero.conf"
		log-file=/dev/null
		rpc-login=${MONERO_RPC_USER:-monero}:${MONERO_RPC_PASSWORD:-password}
		EOF
	fi

	chown -R monero "$MONERO_DATA"
	exec gosu monero "$@"
fi

exec "$@"
