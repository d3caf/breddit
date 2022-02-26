defmodule Reddex.Serializer do
  @behaviour OAuth2.Serializer

  @impl true
  def encode!(data), do: Jason.encode!(data)

  @impl true
  def decode!(data), do: Jason.decode!(data, keys: :atoms)
end
