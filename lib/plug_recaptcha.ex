defmodule PlugRecaptcha do
  import Plug.Conn

  def init(default), do: default

  def call(conn, [recaptcha_secret: secret]) do
    case conn do
      %Plug.Conn{params: %{"signature" => signature}} ->
        case verify_signature(signature, secret) do
          {:ok} -> conn
          _ -> halt_connection(conn)
        end
      _ -> halt_connection(conn)
    end
  end
  def call(_conn, _opts), do: raise "Recaptcha Secret is missing"

  defp verify_signature(signature, secret) do
    post_url = "https://www.google.com/recaptcha/api/siteverify?secret=#{secret}&response=#{signature}"
    case HTTPoison.post(post_url, "", [{"Content-Type", "application/json"}]) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        Poison.decode(body)
        |> verify_response
      _ -> {:fail}
    end
  end

  defp verify_response({:ok, %{"success" => true}}), do: {:ok}
  defp verify_response(_), do: {:fail}

  defp halt_connection(conn) do
    conn
    |> put_status(:forbidden)
    |> halt   
  end
end

