FROM ruby:3.2.2-alpine3.16 as base

# Install dependencies:
# - build-base: To ensure certain gems can be compiled
# - nodejs: Compile assets
# - postgresql-dev postgresql-client: Communicate with postgres through the postgres gem
# - libxslt-dev libxml2-dev: Nokogiri native dependencies
# - imagemagick: for image processing
RUN apk --update add build-base nodejs tzdata postgresql-dev postgresql-client libxslt-dev libxml2-dev imagemagick

# https://hub.docker.com/r/praekeltfoundation/alpine-buildpack-deps/
# libmagickwand-dev vs imagemagick-dev ????
RUN apk add --upgrade imagemagick-dev


# Set an environment variable to store where the app is installed inside
# of the Docker image.
ENV INSTALL_PATH /backend
RUN mkdir -p $INSTALL_PATH

# This sets the context of where commands will be ran in and is documented
# on Docker's website extensively.
WORKDIR $INSTALL_PATH

# Use the Gemfiles as Docker cache markers. Always bundle before copying app src.
# (the src likely changed and we don't want to invalidate Docker's cache too early)
# http://ilikestuffblog.com/2014/01/06/how-to-skip-bundle-install-when-deploying-a-rails-app-to-docker/
COPY Gemfile Gemfile.lock ./

# Set RAILS_ENV and RACK_ENV
ARG RAILS_ENV
ENV RACK_ENV=$RAILS_ENV

# Prevent bundler warnings; ensure that the bundler version executed is >= that which created Gemfile.lock
RUN gem install bundler

# Finish establishing our Ruby enviornment depending on the RAILS_ENV
RUN if [[ "$RAILS_ENV" == "production" ]]; then bundle install --without development test; else bundle install; fi

# Copy the main application.
COPY . ./

CMD ["bundle", "exec", "rails", "s"]

