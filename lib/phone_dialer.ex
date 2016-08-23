defmodule PhoneDialer do
  @type digits :: String.t

  @mapped_digits %{"1"     => "1",
                   "2ABC"  => "2",
                   "3DEF"  => "3",
                   "4GHI"  => "4",
                   "5JKL"  => "5",
                   "6MNO"  => "6",
                   "7PQRS" => "7",
                   "8TUV"  => "8",
                   "9WXYZ" => "9",
                   "+"     => "*",
                   "0 "    => "0",
                   "#"     => "#"}

  @doc """
  Converts binary input to phone dialer digits

  ## Example
    >iex PhoneDialer.to_digit("8")
    "V"
  """
  @spec to_digits(binary) :: digits
  def to_digits(input) do
    input
    |> tokenize
    |> Enum.map(&find_tuple/1)
    |> Enum.map(fn({_, v}) -> v end)
    |> Enum.join
  end

  defp tokenize(input) do
    to_string(input)
    |> String.graphemes
    |> Enum.map(&String.upcase/1)
  end

  defp find_tuple(char) do
    @mapped_digits
    |> Enum.find({nil, char}, fn({k, _}) -> String.contains?(k, char) end)
  end
end
