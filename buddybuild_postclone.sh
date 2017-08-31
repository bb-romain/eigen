#!/bin/bash

gem install bundler
bundle install --without development distribution
make oss
