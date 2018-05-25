#!/bin/bash
bash -c 'for i in pages/*.md; do pandoc -f markdown -t html -s "$i" > build/"$i".html; done; '
cp -r images build
