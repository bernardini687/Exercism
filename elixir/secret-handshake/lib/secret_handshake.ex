defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    bits = to_bits(code)

    if length(bits) == 5 do
      decode(bits, [])
    else
      []
    end
  end

  defp to_bits(int) do
    Integer.to_string(int, 2)
    |> String.pad_leading(5, "0")
    |> String.split("", trim: true)
  end

  defp decode([r, j, c, d, "1"], message) do
    decode([r, j, c, d, nil], ["wink" | message])
  end

  defp decode([r, j, c, "1", _], message) do
    decode([r, j, c, nil, nil], ["double blink" | message])
  end

  defp decode([r, j, "1", _, _], message) do
    decode([r, j, nil, nil, nil], ["close your eyes" | message])
  end

  defp decode([r, "1", _, _, _], message) do
    decode([r, nil, nil, nil, nil], ["jump" | message])
  end

  defp decode([r, _, _, _, _], message) do
    if r == "1" do
      message
    else
      Enum.reverse(message)
    end
  end
end
