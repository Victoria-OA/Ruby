# Use an official Ruby base image with version 3.1.2
FROM ruby:3.1.2

# Set the working directory inside the container to /app
WORKDIR /app

# Install system dependencies, including Node.js and PostgreSQL client
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Create a directory named 'myapp' inside the container
# and copy the contents of the Budget-App directory into it
RUN mkdir myapp
COPY ./Budget-App /app/myapp

# Change the working directory to /app/myapp
WORKDIR /app/myapp

# Set environment variables for Bundler
ENV BUNDLER_VERSION 2.3.6
ENV BUNDLE_IGNORE_MESSAGES="Your Ruby version is .* but your Gemfile specified 3.1.2"

# Copy the Gemfile and Gemfile.lock from the Budget-App directory to /app/myapp
COPY ./Budget-App/Gemfile /app/myapp
COPY ./Budget-App/Gemfile.lock /app/myapp

# Configure the local nokogiri version to avoid conflicts
RUN bundle config --local nokogiri '1.13.2'

# Install Bundler version 2.3.6
RUN gem install bundler -v 2.3.6

# Install Ruby dependencies using Bundler based on Gemfile and Gemfile.lock
RUN bundle install

# Expose port 3000, which is typically used for Rails applications
EXPOSE 3000

# Define the command to run the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
