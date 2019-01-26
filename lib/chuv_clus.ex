defmodule ChuvClus do
  @file_path System.cwd() <> "/lib/support/locations.csv"

  def clusterize do
    @file_path
    |> File.stream!()
    |> CSV.decode()
    |> Enum.to_list()
    |> Enum.drop(1)
    |> Enum.map(fn {:ok, [values]} ->
      [name | values] =
        values
        |> String.split(";")
        |> Enum.reject(fn x -> x == "" end)

      values =
        values
        |> Enum.with_index()
        |> Enum.map(fn {value, index} -> "object#{index}#{value}" end)

      {name, values}
    end)
    |> Rock.clusterize(2, 0.4)
    |> Enum.map(fn cluster -> Enum.map(cluster, fn {name, _} -> name end) end)
  end
end
