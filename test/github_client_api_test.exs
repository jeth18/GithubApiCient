defmodule GithubClientApiTest do
  use ExUnit.Case
  doctest GithubClientApi

  test "greets the world" do
    assert GithubClientApi.hello() == :world
  end
end
