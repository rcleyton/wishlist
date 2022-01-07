FROM ruby:3.0.2-alpine

ENV BUNDLER_VERSION=2.2.22

RUN apk update && apk add bash build-base nodejs postgresql-dev tzdata 

RUN gem install bundler -v 2.2.22

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle config build.nokogiri --use-system-libraries

RUN bundle check || bundle install

COPY . ./

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]