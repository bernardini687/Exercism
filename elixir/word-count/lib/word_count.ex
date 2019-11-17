defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    words = split(sentence)

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
    |> String.split(~r/[[:blank:][:punct:]]/u, trim: true)
    |> Enum.map(&String.downcase/1)
  end

  def occurrences(words, word) do
    words
    |> Enum.filter(&(&1 == word))
    |> Enum.count()
  end
end
