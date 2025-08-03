#!/bin/bash

# Habilitar o cache de desenvolvimento
bin/rails dev:cache

# Pré-compilar os assets
bin/rails assets:precompile

# Limpar os assets antigos
bin/rails assets:clobber

# Instalar o Tailwind CSS
rails tailwindcss:install
