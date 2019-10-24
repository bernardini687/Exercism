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
    |> to_charlist()
    |> Enum.map(&foo(&1, shift))
    |> to_string()
  end

  def foo(char, 0), do: char
  def foo(char, 26), do: char
  def foo(char, shift) when char + shift in ?A..?Z, do: char + shift
  def foo(char, shift) when char + shift in ?a..?z, do: char + shift
  def foo(char, shift) when char in ?A..?Z, do: (?A - 1) + (char + shift - ?Z)
  def foo(char, shift) when char in ?a..?z, do: (?a - 1) + (char + shift - ?z)
  def foo(char, shift), do: char
end
