defmodule CheckersApi.Repo do
  use Ecto.Repo,
    otp_app: :checkers_api,
    adapter: Ecto.Adapters.Postgres
end
