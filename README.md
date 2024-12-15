# Container Image for Jekyll

Container image for Jekyll.

## Usage

Create new `site` in the current directory.

```shell
docker run --rm -it -v ${PWD}:/srv/jekyll \
    ghcr.io/granito-source/jekyll:4.3.4 \
    jekyll new site
cd site
```

Install required gems.

```shell
docker run --rm -it \
    -v $PWD:/srv/jekyll \
    -v $PWD/vendor/bundle:/usr/local/bundle \
    ghcr.io/granito-source/jekyll:4.3.4 \
    bundle install
```

Periodically you can check for updated dependencies and update
`Gemfile.lock`.

```shell
docker run --rm -it \
    -v $PWD:/srv/jekyll \
    -v $PWD/vendor/bundle:/usr/local/bundle \
    ghcr.io/granito-source/jekyll:4.3.4 \
    bundle update
```

Serve and author the site. The site will be available at
<http://localhost:4000/>.

```shell
docker run --rm -it \
    -v $PWD:/srv/jekyll \
    -v $PWD/vendor/bundle:/usr/local/bundle \
    -p 4000:4000 \
    ghcr.io/granito-source/jekyll:4.3.4 \
    jekyll serve -H 0.0.0.0
```

Build the site.

```shell
docker run --rm -it \
    -v $PWD:/srv/jekyll \
    -v $PWD/vendor/bundle:/usr/local/bundle \
    ghcr.io/granito-source/jekyll:4.3.4 \
    jekyll build
```
