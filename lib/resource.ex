defmodule Breddit.Resource do
  defmacro __using__(_) do
    quote do
      def opts_to_params(defaults, provided), do: Keyword.merge(defaults, provided)
    end
  end
end
