defmodule Reddex.Helpers do
  def format_upvotes(upvotes) when is_number(upvotes) and upvotes > 1_000,
    do:
      upvotes
      |> Kernel./(1000)
      |> Float.round()
      |> drop_whole_floats()
      |> to_string()
      |> Kernel.<>("k")

  def format_upvotes(upvotes), do: "#{upvotes}"

  defp drop_whole_floats(float) do
    {whole, remain} = float |> Float.to_string() |> Integer.parse()
    if remain == ".0", do: whole, else: float
  end
end
