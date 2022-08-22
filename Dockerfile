FROM ruby:3.1-buster

ADD https://dl.yarnpkg.com/debian/pubkey.gpg /tmp/yarn-pubkey.gpg
RUN apt-key add /tmp/yarn-pubkey.gpg && rm /tmp/yarn-pubkey.gpg
RUN echo "deb http://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      nodejs yarn

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 10 --retry 5

ENV RAILS_ENV production
ENV RACK_ENV production
ENV RAILS_SERVE_STATIC_FILES true
COPY . ./

RUN bundle exec rake assets:precompile

CMD bundle exec rake db:migrate && \
    SECRET_KEY_BASE=$(bundle exec rake secret) \
    bundle exec rails s -b '0.0.0.0'
