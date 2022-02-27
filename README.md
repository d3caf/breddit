# 🍞 Breddit
The Reddit client that's as delicious as bread. It's also gluten-free!

> **Note! This is still in heavy development!** It's almost definitely not prod-ready and isn't yet fully tested. PRs are welcomed to add more modules. I'm using Breddit in an app that I'm writing and adding resources as I need them.

## Installation

The package can be installed
by adding `breddit` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:breddit, "~> 0.1.0"}
  ]
end
```

## Setup
Breddit requires some configs in order to properly authenticate with Reddit.

Here is a sample config:
```elixir
config :reddit,
  oauth: [
    client_id: System.get_env("REDDIT_CLIENT_ID"), # required
    client_secret: System.get_env("REDDIT_CLIENT_SECRET"), # required
    redirect_uri: System.get_env("REDDIT_REDIRECT_URI") # required; must match the uri you provided to reddit when creating the app
  ],
  params: %{state: "1", scope: "identity edit flair history mysubreddits privatemessages read report save submit"} # optional, but you'll most likely at least want to add `scope` since it'd be useless to be authenticated with no scope.
```

## Usage
More docs to come... I will be adding moduledocs, specs, etc ASAP!

## Contributing
Feel free to open PRs to add additional modules! As mentioned previously, I'm using this in a separate app and am adding resources as I need them. If there's a resource you need that's not added, please add it :)