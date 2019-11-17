defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    words = split(sentence) |> IO.inspect()

    words
    |> Enum.uniq()
    |> Enum.reduce(
      %{},
      fn word, counts ->
        Map.put_new(counts, word, occurrences(words, word))
      end
    )
  end

  def split(sentence) do
    sentence
    |> String.split(~r(\b))
    |> Enum.filter(fn part -> part =~ ~r([\w\d]+) end)
  end

  def occurrences(words, word) do
    words
    |> Enum.filter(fn w -> w == word end)
    |> Enum.count()
  end
end
