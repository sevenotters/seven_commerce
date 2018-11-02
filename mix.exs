defmodule SevenCommerce.MixProject do
  use Mix.Project

  def project do
    [
      app: :seven_commerce,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {SevenCommerce.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:comeonin, "== 4.1.1"},
      {:bcrypt_elixir, "== 1.1.1"},
      {:seven, path: "../sevenotters"}
    ]
  end
end
