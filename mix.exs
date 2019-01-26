defmodule ChuvClus.MixProject do
  use Mix.Project

  def project do
    [
      app: :chuv_clus,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:clope, "~> 0.1.3"},
      {:csv, "~> 2.0.0"},
      {:rock, "~> 0.1.0"}
    ]
  end
end
