defmodule Sudamerik.Repo.Migrations.CreateRequest do
  use Ecto.Migration

  def change do
    create table(:requests) do
      add :owner, :string

      timestamps
    end

  end
end
