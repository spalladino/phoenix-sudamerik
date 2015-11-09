defmodule Sudamerik.RequestItem do
  use Sudamerik.Web, :model

  schema "request_items" do
    field :qty, :decimal
    belongs_to :request, Sudamerik.Request
    belongs_to :product, Sudamerik.Product

    timestamps
  end

  @required_fields ~w(qty)
  @optional_fields ~w()

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
