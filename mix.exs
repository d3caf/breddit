defmodule Breddit.MixProject do
  use Mix.Project

  def project do
    [
      app: :breddit,
      version: "0.0.3",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: description(),
      name: "Breddit",
      source_url: "https://github.com/d3caf/breddit"
    ]
  end

  defp package() do
    [
      name: "breddit",
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/d3caf/breddit"}
    ]
  end

  defp description() do
    "A Reddit API client using oauth2. Still in HEAVY development so use with caution."
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :oauth2]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:jason, "~> 1.3"},
      {:oauth2, "~> 2.0"}
    ]
  end
end
