defmodule Reddex.PreviewImage do
  @keys ~W(id resolutions source variants enabled)a
  @enforce_keys @keys

  @type t() :: %{
          id: String.t(),
          resolutions: list(__MODULE__.Resolution.t()),
          source: __MODULE__.Resolution.t(),
          height: integer(),
          width: integer(),
          variants: map(),
          enabled: boolean()
        }
  defstruct @keys

  defmodule __MODULE__.Resolution do
    @keys ~W(height width url)a
    @enforce_keys @keys
    @type t() :: %{height: integer(), width: integer(), url: String.t()}

    defstruct @keys
  end
end
