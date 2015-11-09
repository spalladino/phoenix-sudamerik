defmodule Sudamerik.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :code, :string
      add :name, :string
      add :group, :string
      add :price, :decimal
      add :unit, :string
      add :unit_qty, :decimal

      timestamps
    end

  end
end
