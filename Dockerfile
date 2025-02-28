FROM elixir:1.12

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install --yes build-essential postgresql-client inotify-tools

RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix archive.install hex phx_new 1.5.9

RUN curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get install -y nodejs

WORKDIR /app
EXPOSE 4000