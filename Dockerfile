FROM ruby:3.1.2

ENV HOME /application
ENV BUNDLE_PATH /gems

RUN apt update -qq && apt install -y yarn

COPY Gemfile Gemfile.lock $HOME/

WORKDIR $HOME

RUN bundle 

RUN gem install rails

ENTRYPOINT ["bin/rails"]
CMD ["s", "-b", "0.0.0.0"]

EXPOSE 3000
EXPOSE 3050
