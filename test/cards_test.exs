defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "Check the number of cards created" do
    deck_lenght = length(Cards.create_deck())
    assert deck_lenght = 36
  end

  test "check if the deck get shuffled or not" do
    deck = Cards.create_deck()
    # assert deck != Cards.shuffle(deck)
    refute deck == Cards.shuffle(deck)
  end
end
