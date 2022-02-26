defmodule ReddexTest do
  use ExUnit.Case
  doctest Reddex

  test "greets the world" do
    assert Reddex.hello() == :world
  end
end
