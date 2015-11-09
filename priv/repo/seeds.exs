# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Sudamerik.Repo.insert!(%SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

import Ecto.Query
alias Sudamerik.Repo
alias Sudamerik.Product
alias Sudamerik.Request

products = [
	%{code: "20",
		name: "Almendras",
		group: "Frutos secos",
		price: Decimal.new(120),
		unit: "kg"},
	%{code: "21",
		name: "Nueces",
		group: "Frutos secos",
		price: Decimal.new(150),
		unit: "kg"}
]

Enum.each products, fn(p) ->
	existing = Product |> Repo.get_by(%{code: p.code})
	if existing do
		Repo.update!(Product.changeset(existing, p))
	else
		Repo.insert!(Product.changeset(%Product{}, p))
	end
end

counts = Repo.one(Product |> select([e], count(e.id)))
IO.puts "There are #{counts} products"

requests = [
	%{owner: "Manas"}
]

request_count = Repo.one(Request |> select([r], count(r.id)))
if request_count < length(requests) do
	Enum.each requests, fn(r) ->
		Repo.insert!(Request.changeset(%Request{}, r))
	end
	request_count = Repo.one(Request |> select([r], count(r.id)))
end
IO.puts "There are #{request_count} requests"
