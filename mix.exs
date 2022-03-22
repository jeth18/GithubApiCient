defmodule GithubClientApi.MixProject do
  use Mix.Project

  def project do
    [
      app: :github_client_api,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:tesla, "~> 1.4"},
      {:hackney, "~> 1.13"},
      {:httpoison, "~> 1.4.0"},
      {:httpotion, "~> 3.1.0"},
      {:jason, "~> 1.0"},
      {:poison, "~> 5.0"}

    ]
  end
end
