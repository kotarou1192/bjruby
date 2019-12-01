# frozen_string_literal: true

class Card
  def initialize
    @deck = create_deck
    hash_to_array
  end

  def draw(number)
    cards = []
    @ar_deck.slice!(0, number).to_a.each do |val|
      cards.append(val.to_a.flatten!)
    end
    cards
  end

  def remove_joker
    @ar_deck.delete(joker: 0)
  end

  def shuffle
    @ar_deck.shuffle!
  end

  private

  def hash_to_array
    @ar_deck = []
    @deck.each do |key, value|
      value.each { |number| @ar_deck.append(key => number) }
    end
  end

  def create_deck
    {
      heart: (1..13).to_a,
      diamond: (1..13).to_a,
      spade: (1..13).to_a,
      club: (1..13).to_a,
      joker: [0]
    }
  end
end
