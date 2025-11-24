#!/usr/bin/env bash

# Exit on first error
set -o errexit

echo "==> Running bundle install"
bundle install

echo "==> Installing JS dependencies with yarn"
yarn install --pure-lockfile

echo "==> Compiling Canvas assets"
bundle exec rails canvas:compile_assets

echo "==> Running database migrations"
bundle exec rails db:migrate
