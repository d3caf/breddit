defmodule Breddit.Subreddits do
  use Breddit.Resource

  @spec search(OAuth2.Client.t()) :: Breddit.response()
  def search(client) do
    Breddit.get(client, "/subreddits/search?q=trees")
  end

  def autocomplete(client, query, opts \\ []) do
    params =
      opts_to_params([query: query, include_profiles: true, include_over_18: true], opts)
      |> Keyword.put(:query, query)
      |> Enum.into(%{})

    Breddit.get(client, "api/subreddit_autocomplete_v2", params: params)
  end
end
