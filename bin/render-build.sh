#!/usr/bin/env bash
set -o errexit

echo "==> bundle install"
bundle install

echo "==> yarn install"
yarn install --pure-lockfile

echo "==> compile Canvas assets"
bundle exec rails canvas:compile_assets

echo "==> migrate database"
bundle exec rails db:migrate
