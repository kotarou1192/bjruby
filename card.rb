# frozen_string_literal: true
class Card
  def initialize
    @deck = create_deck
  end

  def draw
    @ar_deck.pop.to_a[0]
  end

  def remove_joker
    @deck.reject! { |key, value| key == :joker }
  end

  def shuffle
    @ar_deck = []
    @deck.each do |key, value|
      value.each { |number| @ar_deck.append(key => number) }
    end
    @ar_deck.shuffle!
  end

  private

  def create_deck
    card = {
      heart: (1..13).to_a,
      diamond: (1..13).to_a,
      spade: (1..13).to_a,
      club: (1..13).to_a,
      joker: [0]
    }
  end
end


