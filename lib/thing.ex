defmodule Breddit.Thing do
  @keys ~W(id name kind data)a
  @enforce_keys @keys
  defstruct @keys

  @type t() :: %__MODULE__{id: String.t(), name: String.t(), data: map()}
end
