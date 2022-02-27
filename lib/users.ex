defmodule Breddit.Users do
  use Breddit.Resource

  def submitted(%OAuth2.Client{} = client, username, opts \\ []) do
    params = opts_to_params([sort: "new", type: "links"], opts)
    Breddit.get(client, "user/#{username}/submitted", params: params)
  end
end
