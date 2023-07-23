defmodule Pokelixir do
  defstruct id: :integer,
            name: :string,
            hp: :integer,
            attack: :integer,
            defense: :integer,
            special_attack: :integer,
            special_defense: :integer,
            speed: :integer,
            weight: :integer,
            height: :integer,
            types: []

  def make_struct(response) do
    decoded_body = Jason.decode!(response.body)
    id = decoded_body["id"]
    name = decoded_body["name"]
    stats = decoded_body["stats"]
    hp_map = Enum.at(stats, 0)
    hp = hp_map["base_stat"]
    atck_map = Enum.at(stats, 1)
    attack = atck_map["base_stat"]
    def_map = Enum.at(stats, 2)
    defense = def_map["base_stat"]
    spec_atck_map = Enum.at(stats, 3)
    special_attack = spec_atck_map["base_stat"]
    spec_def_map = Enum.at(stats, 4)
    special_defense = spec_def_map["base_stat"]
    spd_map = Enum.at(stats, 5)
    speed = spd_map["base_stat"]
    weight = decoded_body["weight"]
    height = decoded_body["height"]

    types =
      decoded_body["types"]
      |> Enum.map(fn map -> map["type"]["name"] end)

    %Pokelixir{
      id: id,
      name: name,
      hp: hp,
      attack: attack,
      defense: defense,
      special_attack: special_attack,
      special_defense: special_defense,
      speed: speed,
      weight: weight,
      height: height,
      types: types
    }
  end

  def get(pokemon) do
    url = "https://pokeapi.co/api/v2/pokemon/#{pokemon}"

    response =
      Finch.build(:get, url)
      |> Finch.request!(Pokelixir.Finch)

    make_struct(response)
  end

  def all(limit \\ 10) do
    #   Finch.start_link(name: Pokelixir.Finch)

    #   response_struct =
    #     Finch.build(:get, url <> "?limit=#{limit}")
    #     |> Finch.request!(Pokelixir.Finch)

    #   decoded = Jason.decode!(response_struct.body)

    #   decoded["results"]
    #   |> Enum.map(fn each -> get(each["name"]) end)

    #   next = decoded["next"]

    #   all(next, limit)

    #   IO.inspect(limit)
    []
  end
end
