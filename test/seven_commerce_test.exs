defmodule SevenCommerceTest do
  use ExUnit.Case
  doctest SevenCommerce

  test "greets the world" do
    assert SevenCommerce.hello() == :world
  end
end
