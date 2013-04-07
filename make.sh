#!/bin/bash
rm -R ./bin
cp -R ./src ./bin
find -L ./bin -type f -name "*.lua" | while read FNAME; do
    mv "$FNAME" "${FNAME%.lua}"
done