# The Cindy Tweet Collector

The `collect_tweets.rb` file will collect all mentions of `@cindyli` and save them to the tweets directory.  You'll need a registered twitter app to use it, but then it's pretty straightforward.

## Installation

You'll need:

* Ruby
* the bundler gem (`gem install bundler`)
* A twitter app and OAuth token.
* Once you have that, you'll need to create a file in this directory called `config.json` that should look like this (but with your keys filled in):

```
{
  "consumer_key": "",
  "consumer_secret": "",
  "access_token": "",
  "access_token_secret": ""
}
```

## Collecting Tweets

Once you have your config file set up, all you have to do is run:

```
ruby collect_tweets.rb
```

And then check out the tweets directory!
