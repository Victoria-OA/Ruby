# Use an official Ruby base image
FROM ruby:3.1.2


# Set the working directory inside the container
WORKDIR /app

# Install system dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Install system dependencies
#RUN git clone https://github.com/evans22j/Budget-App.git

RUN mkdir myapp

COPY ./Budget-App /app/myapp

WORKDIR /app/myapp

ENV BUNDLER_VERSION 2.3.6

ENV BUNDLE_IGNORE_MESSAGES="Your Ruby version is .* but your Gemfile specified 3.1.2"    

# Copy the Gemfile and GemfiBuild a Dockerfile for deploying a simple Ruby on Rails appl>

COPY ./Budget-App/Gemfile /app/myapp

COPY ./Budget-App/Gemfile.lock /app/myapp

RUN bundle config --local nokogiri '1.13.2'
# Install Ruby dependencies using Bundler
RUN gem install bundler -v 2.3.6
RUN bundle install

# Copy the rest of the application code into the container
#COPY . .

# Expose a port if the Rails app listens on a specific port (e.g., 3000)
EXPOSE 3000

# Define the command to run the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
