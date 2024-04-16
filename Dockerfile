FROM ruby:3.3.0-alpine3.19

WORKDIR /tmp/setup
COPY Gemfile Gemfile
COPY entrypoint.sh /usr/local/bin/entrypoint
RUN apk add --no-cache --virtual build-deps build-base zlib-dev && \
    gem install bundler && \
    bundle install && \
    apk del --no-cache build-deps && \
    cd / && \
    rm -rf /tmp/setup /usr/gem/cache /root/.bundle && \
    addgroup -g 1000 jekyll && \
    adduser -u 1000 -G jekyll -g Jekyll -D jekyll && \
    chmod 0555 /usr/local/bin/entrypoint && \
    chmod 0755 /usr/local/bundle && \
    chown -R jekyll:jekyll /usr/local/bundle

USER 1000
WORKDIR /srv/jekyll
EXPOSE 4000
ENTRYPOINT ["entrypoint"]
CMD ["jekyll", "--version"]
