defmodule BrokenSun do
  @moduledoc """
  Reimplementing the Enum module using only reduce.
  """

  @doc """
  Reverse a enumerable

  ## Examples

      iex> BrokenSun.reverse(1..10)
      [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]

  """
  def reverse(enumerable) do
    Enum.reduce(enumerable, [], fn x, acc -> [x | acc] end)
  end

  @doc """
  Find the smallest value in an enumerable

  ## Examples

      iex> BrokenSun.min(1..10)
      1

      iex> BrokenSun.min([3, 2, 8])
      2
  """
  def min(enumerable) do
    Enum.reduce(enumerable, fn x, min -> if x < min do x else min end end)
  end

  @doc """
  Find the largest value in an enumerable

  ## Examples

      iex> BrokenSun.max(1..10)
      10

      iex> BrokenSun.max([3, 2, 8, 5])
      8
  """
  def max(enumerable) do
    Enum.reduce(enumerable, fn x, max -> if x > max do x else max end end)
  end

  @doc """
  Apply a function to every element in an enumerable

  ## Examples

      iex(6)> BrokenSun.map 1..10, fn x -> x * x end
      [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
  """
  def map(enumerable, fun) do
    Enum.reduce(enumerable, [], fn x, acc -> acc ++ [fun.(x)] end)
  end

  @doc """
  Apply a function to every element in an enumerable

  ## Examples

      iex(6)> BrokenSun.map_using_reverse 1..10, fn x -> x * x end
      [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
  """
  def map_using_reverse(enumerable, fun) do
    Enum.reduce(enumerable, [], fn x, acc -> [fun.(x) | acc] end) |> reverse()
  end

  @doc """
  Check if an element is in an enumerable

  ## Examples

      iex(1)> BrokenSun.member? 1..10, 4
      true

      iex(2)> BrokenSun.member? 50..10, 4
      false
  """
  def member?(enumerable, element) do
    Enum.reduce(enumerable, false, fn
      _, true -> true
      x, false -> x == element
    end)
  end

  @doc """
  Add all elements in an enumerable

  ## Examples

      iex(1)> BrokenSun.sum 1..10
      55

  """
  def sum(enumerable) do
    Enum.reduce(enumerable, fn x, acc -> x + acc end)
  end

  @doc """
  Only keep elements in the enumerable which evaluate to a truthy value

  ## Examples

      iex(1)> BrokenSun.filter 1..10, fn x -> rem(x,  2) == 0 end
      [2, 4, 6, 8, 10]

  """
  def filter(enumerable, fun) do
    Enum.reduce(enumerable, [], fn x, acc -> if fun.(x) do acc ++ [x] else acc end end)
  end

  @doc """
  Remove duplicates

  ## Examples

      iex(1)> BrokenSun.uniq [3, 6, 3, 6, 8, 9, 2, 5, 8]
      [3, 6, 8, 9, 2, 5]

  """
  def uniq(enumerable) do
    Enum.reduce(enumerable, [], fn x, acc ->
      if member?(acc, x) do
        acc
      else
        acc ++ [x]
      end
    end)
  end

  # Can I benchmark?
  # Is is more efficient to append to a list as I'm enumerating?
  # compared to prepending and then doing a reverse at the end?

end
