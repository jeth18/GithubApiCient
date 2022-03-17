defmodule GithubClientApi do
  use Tesla
  @username "jeth18"
  @adapter Tesla.Adapter.Hackney

  def user_repos(client, login) do
    # pass `client` argument to `Tesla.get` function
    Tesla.get(client, "/users/" <> login <> "/repos")
  end

  def issues(client) do
    Tesla.get(client, "/issues")
  end

  # build dynamic client based on runtime arguments
  def client(token) do
    middleware = [
      {Tesla.Middleware.BaseUrl, "https://api.github.com"},
      {Tesla.Middleware.Headers, [{"Authorization", "token " <> token }, {"user-agent", "Tesla"}]}
    ]

    Tesla.client(middleware, @adapter)
  end

  def go(token) do
    user_repos(client(token), @username)
  end
end
