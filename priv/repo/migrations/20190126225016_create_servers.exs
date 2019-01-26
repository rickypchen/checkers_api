defmodule CheckersApi.Repo.Migrations.CreateServers do
  use Ecto.Migration

  def change do
    create table(:servers, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :ip_address, :string
      add :status, :string
      add :name, :string

      timestamps()
    end

    create unique_index(:servers, [:ip_address])
  end
end
