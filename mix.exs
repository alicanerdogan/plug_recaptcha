defmodule PlugRecaptcha.Mixfile do
  use Mix.Project

  def project do
    [app: :plug_recaptcha,
     version: "0.2.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps(),
     name: "plug_recaptcha",
     source_url: "https://github.com/alicanerdogan/plug_recaptcha"]
  end

  def application do
    []
  end

  def deps do
    [{:plug, "~> 1.3"},
     {:httpoison, "~> 0.11.1"},
     {:poison, "~> 3.1"},
     {:ex_doc, ">= 0.0.0", only: :dev}]
  end

  defp description do
    """
    Plug module for Recaptcha needs Edit
    """
  end

  defp package do
    [name: :plug_recaptcha,
     files: ["lib", "mix.exs", "README.md", "LICENSE"],
     maintainers: ["Alican Erdogan"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/alicanerdogan/plug_recaptcha"}]
  end
end
