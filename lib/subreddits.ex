defmodule Reddex.Subreddits do
  use Reddex.Resource

  @spec search(OAuth2.Client.t()) :: Reddex.response()
  def search(client) do
    Reddex.get(client, "/subreddits/search?q=trees")
  end

  def autocomplete(client, query, opts \\ []) do
    params =
      opts_to_params([query: query, include_profiles: true, include_over_18: true], opts)
      |> Keyword.put(:query, query)
      |> Enum.into(%{})

    Reddex.get(client, "api/subreddit_autocomplete_v2", params: params)
  end
end
