defmodule RotationalCipher do
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
      fn <<char>> ->
        if char in ?a..?z do
          case calc_shift(char, shift, :lower) do
            0 ->
              char + shift

            n ->
              96 + n
          end
        else
          case calc_shift(char, shift, :upper) do
            0 ->
              char + shift

            n ->
              64 + n
          end
        end
      end
    )
  end

  defp calc_shift(char, shift, :lower),
    do: Integer.mod(char + shift - 96, ?z - 96)

  defp calc_shift(char, shift, :upper),
    do: Integer.mod(char + shift - 64, ?Z - 64)
end
