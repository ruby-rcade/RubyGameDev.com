# RubyGameDev.com

RubyGameDev.com is a community-driven, information hub designed to help people build games in Ruby. This repository contains the source code that runs the RubyGameDev.com website. Please consider helping to improve our website.

## Ways that you can help:

* Suggest an improvement
* Report a bug
* Add a new feature
* Fix a bug
* Increase test coverage
* Improve this documentation

We also have a list of issues you can look at on our [Waffle Board: ![Stories in Ready](https://badge.waffle.io/ruby-rcade/RubyGameDev.com.png?label=ready)](https://waffle.io/ruby-rcade/RubyGameDev.com)

## Table of Contents

* [Getting Started](#getting-started)
* [Writing Tests](#writing-tests)
* [Submitting a Pull Request](#submitting-a-pull-request)
* [Getting Help](#getting-help)

## Getting Started

This application is a Rails 4 application. The Ruby version requirement is listed in the `.ruby-version` file.

Begin by forking and cloning the repository to your local environment. Then install the gem dependencies:

```bash
$ cd RubyGameDev.com
$ bundle install
```

Create a database for your local environment by running the migrations:

```bash
$ bundle exec rake db:migrate
```

Then you can start the Rails server and see it running in your browser:

```bash
$ bundle exec rails server -p 7777
```

Then open your browser to http://localhost:7777. Why port 7777? The GitHub OAuth callback is configured to be running on this port.

## Writing Tests

Tests are an important part of making sure our website is running correctly. We appreciate when you include tests when you contribute new features or fix bugs, but don't let that stop you from getting involved. We've tried to make it easy for you to start writing tests. Start up Guard in order to run the test suite:

```bash
$ bundle exec guard
```

Press enter to run all of the tests, or save a file to run its corresponding test automatically.

We use RSpec for unit tests and Cucumber for integration tests.

## Submitting a Pull Request

From your forked repository, create a separate branch. Then submit your pull request. When your pull request has been accepted, it will automatically be deployed.

## Getting Help

If you ever need help, don't hesitate to ask. We don't have a mailing list, so feel free to submit a GitHub issue or join us in our [Gitter chat room](https://gitter.im/ruby-rcade/RubyGameDev.com?utm_source=badge&utm_medium=badge&utm_campaign=share-badge).
