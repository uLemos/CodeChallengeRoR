#!/bin/bash

# Enable development caching
bin/rails dev:cache

# Pre-compile the assets
bin/rails assets:precompile

# Clean the old assets
bin/rails assets:clobber

# Install Tailwind CSS
rails tailwindcss:install
