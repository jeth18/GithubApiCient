defmodule Github do
  HTTPoison.start
  @username "MachinesAreUs"
  @token "123"

  "https://api.github.com/users/#{@username}/repos"
    |> HTTPoison.get(headers: [{"Authorization", "token " <> @token }, {"user-agent", "Tesla"}])
    |> Map.get(:body)
    |> Poison.decode!()
    |> Enum.each(fn repo ->
      def unquote(String.to_atom(repo["name"]))() do
        unquote(Macro.escape(repo))
      end
    end)
  def go(repo) do
    url = apply(__MODULE__, repo, [])["html_url"]
    IO.puts "Launching browser to #{url}..."
    System.cmd("open", [url])
  end
end
