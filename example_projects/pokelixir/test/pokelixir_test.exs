defmodule PokelixirTest do
  use ExUnit.Case
  doctest Pokelixir

  test "get/1 returns a pokemon struct" do
    assert Pokelixir.get("charizard") == %Pokelixir{
             id: 6,
             name: "charizard",
             hp: 78,
             attack: 84,
             defense: 78,
             special_attack: 109,
             special_defense: 85,
             speed: 100,
             weight: 905,
             height: 17,
             types: ["fire", "flying"]
           }
  end

  test "all/1 returns all pokemon structs" do
    assert length(Pokelixir.all(3)) == 3
    # first element is a pokemon struct 
  end
end
