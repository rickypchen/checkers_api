defmodule CheckersApi.Checker.Server do
  use Ecto.Schema
  import Ecto.Changeset

  alias CheckersApi.Checker.IPv4

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "servers" do
    field :ip_address, IPv4
    field :name, :string
    field :status, :string, default: "init"

    timestamps()
  end

  @doc false
  def changeset(server, attrs) do
    server
    |> cast(attrs, [:ip_address, :status, :name])
    |> validate_required([:ip_address, :status, :name])
  end
end
