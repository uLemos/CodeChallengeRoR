# syntax=docker/dockerfile:1
# Ensure to use a consistent Ruby version
ARG RUBY_VERSION=3.2.3
FROM ruby:$RUBY_VERSION-slim-bookworm

# Set the working directory to /rails inside the container
WORKDIR /rails  

# Install dependencies
RUN apt-get update -qq && \
  apt-get install --no-install-recommends -y \
  build-essential \
  git \
  curl \
  nodejs \
  yarn \
  postgresql-client \
  nano \
  libyaml-dev \
  libpq-dev \
  libjemalloc2 \
  libvips \
  pkg-config \
  node-gyp && \
  rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

# Adding wait-for-it script to wait for the DB to be ready before starting the Rails app
# ADD https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh /wait-for-it.sh
# RUN chmod +x /wait-for-it.sh

# Install Node.js and Yarn (for Tailwind)
ARG NODE_VERSION=18.15.0
ARG YARN_VERSION=latest
ENV PATH=/usr/local/node/bin:$PATH
RUN curl -sL https://github.com/nodenv/node-build/archive/master.tar.gz | tar xz -C /tmp/ && \
  /tmp/node-build-master/bin/node-build "${NODE_VERSION}" /usr/local/node && \
  npm install -g yarn@$YARN_VERSION && \
  rm -rf /tmp/node-build-master

# Install the gems
COPY Gemfile Gemfile.lock ./
ARG RAILS_ENV=development

RUN bundle install --jobs 4 --retry 3

# Install Yarn dependencies
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

# Copy the application code into the container
COPY . .

# Run CSS build with PostCSS + Tailwind
RUN npx postcss app/assets/stylesheets/application.css -o app/assets/builds/tailwind.css
    
# Expose the Rails port (3000) to make the application accessible
EXPOSE 3000

# Set the default environment for Rails
ENV RAILS_ENV=${RAILS_ENV}

# Run the Rails server, make sure to wait for the database before starting
CMD ["rails", "server", "-b", "0.0.0.0"]
