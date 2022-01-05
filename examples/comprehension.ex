propositions = [
  %{id: 1, state: "CA", description: "highway bond"},
  %{id: 2, state: "WA", description: "Fuel Tax"}
]

locations = [
  %{id: 1, state: "CA", address: "123 Main St"},
  %{id: 2, state: "WA", address: "321 Main St"}
]

res =
  for x = %{state: stateA} <- propositions,
      y = %{state: stateB} <- locations,
      stateA === "CA" && stateB === "CA" do
    Map.put(x, :address, y.address)
  end

IO.inspect(res)
