defmodule RotationalCipher do
  @locase_start ?a - 1
  @upcase_start ?A - 1

  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  ## Example

      iex> RotationalCipher.rotate("Attack at dawn", 13)
      "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    do_rotate(text, shift)
  end

  defp do_rotate(text, 0), do: text

  defp do_rotate(text, shift) when shift > 0 do
    String.replace(
      text,
      ~r/[a-zA-Z]/,
      fn <<char>> -> wrap_char(char, shift) end
    )
  end

  def wrap_char(char, shift) when char in ?a..?z do
    case calc_wrap(char, shift, :lower) do
      0 -> char + shift
      n -> @locase_start + n
    end
  end

  def wrap_char(char, shift) when char in ?A..?Z do
    case calc_wrap(char, shift, :upper) do
      0 -> char + shift
      n -> @upcase_start + n
    end
  end

  defp calc_wrap(char, shift, :lower),
    do: rem(char + shift - @locase_start, ?z - @locase_start)

  defp calc_wrap(char, shift, :upper),
    do: rem(char + shift - @upcase_start, ?Z - @upcase_start)
end
