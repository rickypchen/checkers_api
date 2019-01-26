defmodule CheckersApi.Checker.IPv4 do
  @moduledoc """
  Custom Ecto type for IPv4 Address
  https://github.com/jerel/ecto_fields/blob/master/lib/fields/ip4.ex
  """
  @behaviour Ecto.Type
  def type, do: :string

  def cast(nil), do: {:ok, nil}
  def cast(ip) when is_binary(ip) and byte_size(ip) > 0 do
    case verify_ip_string(ip) do
      {:ok, _} -> {:ok, ip}
      {:error, _} -> :error
    end
  end
  def cast(_), do: :error

  defp verify_ip_string(ip) do
    ip
    |> String.to_charlist
    |> :inet_parse.ipv4strict_address
  end

  def load(ip), do: {:ok, ip}

  def dump(ip), do: {:ok, ip}
end
