#!/bin/bash

[ -x ./node_modules/pajv/index.js ] || npm i

./node_modules/pajv/index.js validate -s ../../json-schema/ability-schema.json -d ../../json/english/ability.json
./node_modules/pajv/index.js validate -s ../../json-schema/artist-schema.json -d ../../json/english/artist.json
./node_modules/pajv/index.js validate -s ../../json-schema/card-schema.json -d ../../json/english/card.json
./node_modules/pajv/index.js validate -s ../../json-schema/card-flattened-schema.json -d ../../json/english/card-flattened.json
./node_modules/pajv/index.js validate -s ../../json-schema/edition-schema.json -d ../../json/english/edition.json
./node_modules/pajv/index.js validate -s ../../json-schema/foiling-schema.json -d ../../json/english/foiling.json
./node_modules/pajv/index.js validate -s ../../json-schema/icon-schema.json -d ../../json/english/icon.json
./node_modules/pajv/index.js validate -s ../../json-schema/keyword-schema.json -d ../../json/english/keyword.json
./node_modules/pajv/index.js validate -s ../../json-schema/rarity-schema.json -d ../../json/english/rarity.json
./node_modules/pajv/index.js validate -s ../../json-schema/set-schema.json -d ../../json/english/set.json
./node_modules/pajv/index.js validate -s ../../json-schema/type-schema.json -d ../../json/english/type.json

./node_modules/pajv/index.js validate -s ../../json-schema/ability-schema.json -d ../../json/french/ability.json
./node_modules/pajv/index.js validate -s ../../json-schema/artist-schema.json -d ../../json/french/artist.json
./node_modules/pajv/index.js validate -s ../../json-schema/card-schema.json -d ../../json/french/card.json
./node_modules/pajv/index.js validate -s ../../json-schema/card-flattened-schema.json -d ../../json/french/card-flattened.json
./node_modules/pajv/index.js validate -s ../../json-schema/keyword-schema.json -d ../../json/french/keyword.json
./node_modules/pajv/index.js validate -s ../../json-schema/set-schema.json -d ../../json/french/set.json
./node_modules/pajv/index.js validate -s ../../json-schema/type-schema.json -d ../../json/french/type.json

./node_modules/pajv/index.js validate -s ../../json-schema/ability-schema.json -d ../../json/german/ability.json
./node_modules/pajv/index.js validate -s ../../json-schema/artist-schema.json -d ../../json/german/artist.json
./node_modules/pajv/index.js validate -s ../../json-schema/card-schema.json -d ../../json/german/card.json
./node_modules/pajv/index.js validate -s ../../json-schema/card-flattened-schema.json -d ../../json/german/card-flattened.json
./node_modules/pajv/index.js validate -s ../../json-schema/keyword-schema.json -d ../../json/german/keyword.json
./node_modules/pajv/index.js validate -s ../../json-schema/set-schema.json -d ../../json/german/set.json
./node_modules/pajv/index.js validate -s ../../json-schema/type-schema.json -d ../../json/german/type.json

./node_modules/pajv/index.js validate -s ../../json-schema/ability-schema.json -d ../../json/italian/ability.json
./node_modules/pajv/index.js validate -s ../../json-schema/artist-schema.json -d ../../json/italian/artist.json
./node_modules/pajv/index.js validate -s ../../json-schema/card-schema.json -d ../../json/italian/card.json
./node_modules/pajv/index.js validate -s ../../json-schema/card-flattened-schema.json -d ../../json/italian/card-flattened.json
./node_modules/pajv/index.js validate -s ../../json-schema/keyword-schema.json -d ../../json/italian/keyword.json
./node_modules/pajv/index.js validate -s ../../json-schema/set-schema.json -d ../../json/italian/set.json
./node_modules/pajv/index.js validate -s ../../json-schema/type-schema.json -d ../../json/italian/type.json

./node_modules/pajv/index.js validate -s ../../json-schema/ability-schema.json -d ../../json/spanish/ability.json
./node_modules/pajv/index.js validate -s ../../json-schema/artist-schema.json -d ../../json/spanish/artist.json
./node_modules/pajv/index.js validate -s ../../json-schema/card-schema.json -d ../../json/spanish/card.json
./node_modules/pajv/index.js validate -s ../../json-schema/card-flattened-schema.json -d ../../json/spanish/card-flattened.json
./node_modules/pajv/index.js validate -s ../../json-schema/keyword-schema.json -d ../../json/spanish/keyword.json
./node_modules/pajv/index.js validate -s ../../json-schema/set-schema.json -d ../../json/spanish/set.json
./node_modules/pajv/index.js validate -s ../../json-schema/type-schema.json -d ../../json/spanish/type.json
