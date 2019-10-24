defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  ## Example

      iex> RotationalCipher.rotate("Attack at dawn", 13)
      "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    # secret = for char <- to_charlist(text), do: char + shift
    text
    |> to_charlist
    |> Enum.map &(&1 + shift)
    |> to_string()
  end
end
