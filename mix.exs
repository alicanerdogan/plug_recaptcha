defmodule PlugRecaptcha.Mixfile do
  use Mix.Project

  def project do
    [app: :plug_recaptcha,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [extra_applications: [:logger]]
  end

  def deps do
    [{:plug, "~> 1.3"},
     {:httpoison, "~> 0.11.1"},
     {:poison, "~> 3.1"}]
  end
end
