# frozen_string_literal: true
class Players
  def initialize(card)
    @card = card
    @card.shuffle
    @card.remove_joker
  end

  def pull
    hands = @card.draw
    point = hands.pop
    puts hands.pop.to_s + 'の' + point.to_s + 'を引いた'
    point
  end

  def pull_secretly
    hands = @card.draw
    point = hands.pop
    puts 'カードを引いた'
    point
  end
end
