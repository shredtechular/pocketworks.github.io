#!/bin/bash

set -e

# Netlify requires a _redirects file to be in the root of the built site, 
# however SiteLeaf removes this file if it is included in the config.
# This command renames the _redirects.markdown file to _redirects so it 
# can then be built properly in travis.
mv _redirects.markdown _redirects