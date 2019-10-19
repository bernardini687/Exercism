defmodule SecretHandshake do
  @msg [:rev, "jump", "close your eyes", "double blink", "wink"]

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
    msg =
      code
      |> to_bits()
      |> select_actions()

    if List.starts_with?(msg, [:rev]) do
      [_ | actions] = msg
      Enum.reverse(actions)
    else
      msg
    end
  end

  def to_bits(int) do
    Integer.to_string(int, 2)
    |> String.pad_leading(5, "0")
    |> String.codepoints()
    |> Enum.with_index()
  end

  def select_actions(bits) do
    for {bit, index} <- bits,
        bit == "1" do
      {action, _} = List.pop_at(@msg, index)
      action
    end
  end
end
