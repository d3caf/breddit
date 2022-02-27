defmodule ReddexTest do
  use ExUnit.Case
  doctest Breddit

  test "greets the world" do
    assert Breddit.hello() == :world
  end
end
