FROM ruby:3.3.0-alpine3.19

WORKDIR /tmp/setup
COPY Gemfile Gemfile
RUN apk add --no-cache --virtual build-deps build-base zlib-dev && \
    gem install bundler && \
    bundler install && \
    apk del --no-cache build-deps && \
    cd / && \
    rm -rf /tmp/setup /usr/gem/cache /root/.bundle/cache

WORKDIR /srv/jekyll
EXPOSE 4000
ENTRYPOINT ["bundler", "exec", "jekyll"]
CMD ["--version"]
