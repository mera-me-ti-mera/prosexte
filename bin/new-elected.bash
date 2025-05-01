#!/bin/bash
set -e -u -o pipefail
set -x
rm -vf new.sqlite3
sqlite3 new.sqlite3 << EEOOTT
.bail on
.import --csv 'bills/elected.csv' elected
.import --csv 'bills/bill2elected.csv' bill2elected
SELECT DISTINCT elected_url FROM bill2elected WHERE elected_url NOT IN (SELECT DISTINCT url FROM elected);
EEOOTT
