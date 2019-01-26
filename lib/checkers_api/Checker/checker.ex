defmodule CheckersApi.Checker do
  @moduledoc """
  The Checker context - the monitor
  """
  import Ecto.Query, warn: false
  alias CheckersApi.{Repo, Checker.Server}

  def list_servers do
    Repo.all(Server)
  end

  def get_server(id), do: Repo.get(Server, id)

  def create_server(attrs \\ %{}) do
    %Server{}
    |> Server.changeset(attrs)
    |> Repo.insert()
  end

  def update_server(%Server{} = server, attrs) do
    server
    |> Server.changeset(attrs)
    |> Repo.update()
  end

  def delete_server(%Server{} = server) do
    Repo.delete(server)
  end
end
