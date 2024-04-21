FROM ruby:3.3.0-alpine3.19

WORKDIR /tmp/setup
COPY Gemfile Gemfile
RUN apk add --no-cache build-base zlib-dev && \
    gem install bundler && \
    bundle install && \
    cd / && \
    rm -rf /tmp/setup /usr/gem/cache /root/.bundle && \
    addgroup -g 1000 jekyll && \
    adduser -u 1000 -G jekyll -g Jekyll -D jekyll && \
    chown -R jekyll:jekyll /usr/local/bundle

USER 1000
WORKDIR /srv/jekyll
EXPOSE 4000
CMD ["jekyll", "--version"]
