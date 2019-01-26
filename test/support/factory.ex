defmodule CheckersApi.Factory do
  use ExMachina.Ecto, repo: CheckersApi.Repo
  use CheckersApi.ServerFactory
end
