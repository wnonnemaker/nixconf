#!/usr/bin/env bash
set -euo pipefail

YEAR=$(date +%Y)
MONTH=$(date +%m)

entry() {
	local day="$1"
	local desc="$2"
	local amount="$3"
	printf "\n%s-%s-%02d %s\n    %-34s  %s\n    liabilities:creditcard\n" \
		"$YEAR" "$MONTH" "$day" "$desc" "expenses:monthly" "$amount"
}

{
	entry 10 "iCloud subscription"  "0.99"
	entry 28 "Claude subscription"  "20.00"
	entry  2 "Spotify subscription" "12.99"
	entry 11 "NYT subscription"     "12.00"
} >> "$LEDGER_FILE"

echo "Appended 4 entries to $LEDGER_FILE"
