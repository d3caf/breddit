defmodule Reddex.Users do
  use Reddex.Resource

  def submitted(%OAuth2.Client{} = client, username, opts \\ []) do
    params = opts_to_params([sort: "new", type: "links"], opts)
    Reddex.get(client, "user/#{username}/submitted", params: params)
  end
end
