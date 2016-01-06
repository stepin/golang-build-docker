FROM golang

# bzr git mercurial subversion for go get
# ruby ruby-dev build-essentials for fpm
RUN apt-get update -y && apt-get install -y \
  bzr \
  git \
  mercurial \
  subversion \
  ruby ruby-dev rpm g++ gcc libc6-dev libssl-dev make \
  zip \
  curl \
  && apt-get clean \
  && gem install fpm --no-ri --no-rdoc \
  && go get -v github.com/mitchellh/gox github.com/tcnksm/ghr \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
