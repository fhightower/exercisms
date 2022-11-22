FROM ruby:3.2-rc-buster

WORKDIR /code

RUN wget https://github.com/exercism/cli/releases/download/v3.1.0/exercism-3.1.0-linux-x86_64.tar.gz
RUN tar -xf exercism-3.1.0-linux-x86_64.tar.gz
RUN mv exercism /usr/local/bin

RUN exercism version
RUN exercism configure --token=a3ec7b49-66f5-4773-a7d1-61318440353f --workspace=/code

RUN gem install rubocop

