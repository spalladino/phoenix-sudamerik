defmodule Sudamerik.RequestItemTest do
  use Sudamerik.ModelCase

  alias Sudamerik.RequestItem

  @valid_attrs %{qty: "120.5"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = RequestItem.changeset(%RequestItem{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = RequestItem.changeset(%RequestItem{}, @invalid_attrs)
    refute changeset.valid?
  end
end
