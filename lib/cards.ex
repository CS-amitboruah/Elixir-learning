defmodule Cards do
  # def hello do
  #   "hello world"
  # end

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

  def create_deck do
    values = ['Ace', 'One', 'Two', 'Three', 'Four', 'Five', 'Six']
    suits = ['Spades', 'Hearts', 'Clubs', 'Diamonds']

    cards =
      for suit <- suits, value <- values do
        "#{value} of #{suit} "
      end

    List.flatten(cards)
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_Size) do
    Enum.split(deck, hand_Size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    {status, binary} = File.read(filename)

    case status do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, reason} -> "File does not exist"
    end
  end
end
