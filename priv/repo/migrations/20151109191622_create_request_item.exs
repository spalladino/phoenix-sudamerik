defmodule Sudamerik.Repo.Migrations.CreateRequestItem do
  use Ecto.Migration

  def change do
    create table(:request_items) do
      add :qty, :decimal
      add :request_id, references(:requests)
      add :product_id, references(:products)

      timestamps
    end
    create index(:request_items, [:request_id])
    create index(:request_items, [:product_id])

  end
end
