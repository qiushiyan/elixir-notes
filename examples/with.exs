opts = %{width: 10, height: 15}

with_var =
  with {:ok, width} <- Map.fetch(opts, :width),
       {:ok, height} <- Map.fetch(opts, :height) do
    {:ok, width * height}
  end

comprehension_var =
  for %{width: width, height: height} <- [opts] do
    width * height
  end

IO.inspect(with_var)
IO.inspect(comprehension_var)
