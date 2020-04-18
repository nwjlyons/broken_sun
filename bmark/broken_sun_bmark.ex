defmodule BrokenSunBmark do
  use Bmark

  bmark :map do
    BrokenSun.map(1..100, fn x -> x * x end)
  end

  bmark :map_using_reverse do
    BrokenSun.map_using_reverse(1..100, fn x -> x * x end)
  end
end
