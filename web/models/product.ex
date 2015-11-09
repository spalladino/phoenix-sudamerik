defmodule Sudamerik.Product do
  use Sudamerik.Web, :model

  schema "products" do
    field :code, :string
    field :name, :string
    field :group, :string
    field :price, :decimal
    field :unit, :string
    field :unit_qty, :decimal

    timestamps
  end

  @required_fields ~w(code name group price unit)
  @optional_fields ~w(unit_qty)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
