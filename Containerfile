FROM ruby:alpine

RUN apk add build-base yaml-dev git

RUN mkdir -p /ruby/jekyll-org
COPY Gemfile /ruby/jekyll-org/Gemfile
COPY jekyll-org.gemspec /ruby/jekyll-org/jekyll-org.gemspec

RUN mkdir /bundle && chmod -R ugo+rwt /bundle
VOLUME /bundle
ENV BUNDLE_PATH='/bundle'
ENV PATH="/bundle/ruby/$RUBY_VERSION/bin:${PATH}"

WORKDIR /ruby/jekyll-org
RUN bundle install
