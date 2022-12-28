defmodule Cards do
  @moduledoc """
   Provides methods to shuffle the deck hand the desire number of random cards.
  """

  def hello do
    "hello world"
  end

  # def create_deck do
  #   values = ['Ace', 'One', 'Two', 'Three', 'Four', 'Five', 'Six']
  #   suits = ['Spades', 'Hearts', 'Clubs', 'Diamonds']

  #   cards =
  #     for value <- values do
  #       for suit <- suits do
  #         "#{value} of #{suit} "
  #       end
  #     end

  #   List.flatten(cards)
  # end

  @doc """
  combine the number and the face of the cards, and create the deck from it.
  """
  def create_deck do
    values = ['Ace', 'One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine']
    suits = ['Spades', 'Hearts', 'Clubs', 'Diamonds']

    cards =
      for suit <- suits, value <- values do
        "#{value} of #{suit} "
      end

    List.flatten(cards)
  end

  @doc """
  this method will take deck as a parameter and shuffle that deck.
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Determines whether the mention card present inside the deck or not

  ## Examples
      iex>deck = Cards.create_deck
      iex>Cards.contains?(deck,"Ace of Hearts ")
      iex>true
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  this method will take a deck ask for the `hand_size` , and hand the number of card from the deck of the cards.

  ## Examples

      iex> deck = Cards.create_deck
      iex>{hand,deck} = Cards.deal(deck,1)
      iex>hand
      ["Ace of Spades "]
  """
  def deal(deck, hand_Size) do
    Enum.split(deck, hand_Size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  # def load(filename) do
  #   {status, binary} = File.read(filename)

  #   case status do
  #     {:ok, _binary} -> :erlang.binary_to_term(binary)
  #     {:error, _reason} -> "File does not exist"
  #   end
  # end

  def create_hand(hand_size) do
    # deck = Cards.create_deck
    # deck = Cards.shuffle(deck)
    # hand = Cards.deal(deck,hand_size)

    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end
end
