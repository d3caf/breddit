defmodule Breddit do
  require Logger
  use OAuth2.Strategy
  alias OAuth2.Strategy.AuthCode

  # @scopes "identity edit flair history mysubreddits privatemessages read report save submit"
  @site "https://oauth.reddit.com"
  @root_url @site

  @default_config [
    strategy: Breddit,
    site: "https://oauth.reddit.com/",
    authorize_url: "https://www.reddit.com/api/v1/authorize",
    token_url: "https://www.reddit.com/api/v1/access_token",
    params: %{duration: "permanent"},
    headers: [
      {"User-Agent", "web:breddit:v.0.0.1 (by u/andrex092)"},
      {"Content-Type", "application/x-www-form-urlencoded"}
    ]
  ]

  @type response :: {:ok, any()} | {:error, OAuth2.Error.t()}

  # TODO: extract to mix config
  defp config do
    @default_config
    |> Config.Reader.merge(Application.get_env(:breddit, :oauth))
    |> Keyword.update!(:params, &Map.merge(&1, Application.get_env(:breddit, :params)))
    #FIXME
    # |> Keyword.update!(:headers, &([Application.get_env(:breddit, :headers) | &1]))
  end

  defp url(uri, params, opts \\ []) do
    opts
    |> Keyword.get(:site, @root_url)
    |> URI.parse()
    |> URI.merge(uri)
    |> Map.put(:query, URI.encode_query(params))
    |> URI.to_string()
  end

  # Public API
  def client(args \\ []) do
    config()
    |> Keyword.merge(args)
    |> OAuth2.Client.new()
    |> OAuth2.Client.put_serializer("application/json", Jason)
  end

  def get(client, uri, opts \\ [], headers \\ []) do
    url = url(uri, Keyword.get(opts, :params))

    Logger.info("Getting: #{url}")

    client
    |> OAuth2.Client.put_serializer("application/json", Breddit.Serializer)
    |> OAuth2.Client.get(url, headers, opts)
    |> parse_response()
  end

  @spec parse_response({:ok, OAuth2.Response.t()} | {:error, OAuth2.Error.t()}) :: response()
  defp parse_response({:ok, %OAuth2.Response{body: body}}) do
    {:ok, body}
  end

  defp parse_response({:error, error}), do: {:error, error}

  def authorize_url!(params \\ []) do
    OAuth2.Client.authorize_url!(
      client(),
      Keyword.merge(params, client_secret: Keyword.get(config(), :client_secret))
    )
  end

  def get_token!(params \\ [], _headers \\ []) do
    OAuth2.Client.get_token!(
      client(),
      Keyword.merge(params, client_secret: Keyword.get(config(), :client_secret))
    )
  end

  # Strats
  def authorize_url(client, params) do
    AuthCode.authorize_url(client, params)
  end

  def get_token(client, params, headers) do
    client
    |> put_header("Accept", "application/json")
    |> AuthCode.get_token(params, headers)
  end
end
