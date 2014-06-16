#!/bin/bash

cd $(dirname $0)

sudo cp -f prometeus.lang /usr/share/gtksourceview-2.0/language-specs
sudo cp -f prometeus.lang /usr/share/gtksourceview-3.0/language-specs

