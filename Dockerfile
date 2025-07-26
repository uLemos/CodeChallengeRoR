# syntax=docker/dockerfile:1
# check=error=true

# This Dockerfile is designed for production, not development. Use with Kamal or build'n'run by hand:
# docker build -t news_aggregator_app .
# docker run -d -p 80:80 -e RAILS_MASTER_KEY=<value from config/master.key> --name news_aggregator_app news_aggregator_app

# For a containerized dev environment, see Dev Containers: https://guides.rubyonrails.org/getting_started_with_devcontainer.html

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version
FROM ruby:3.2.3

# Install base packages
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    curl \
    libjemalloc2 \
    libvips \
    postgresql-client \
    nodejs && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

# Rails app lives here
WORKDIR /app

# Copying Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Installing the project gems
RUN bundle install

# Copying the application code to the container
COPY . .

# Exposing port 3000 to Rails application (development)
EXPOSE 3000

# Defining the runtime environment
ARG RAILS_ENV=development
ENV RAILS_ENV=${RAILS_ENV}

# Command to run the Rails server, adjusting for the environment
CMD ["rails", "server", "-b", "0.0.0.0"]