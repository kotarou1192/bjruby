# frozen_string_literal: true
class Players
  def initialize(card)
    @card = card
    @card.shuffle
    @card.remove_joker
  end

  def pull
    hands = @card.draw(1).flatten
    point = hands[1]
    puts hands[0].to_s + 'の' + point.to_s + 'を引いた'
    point
  end

  def pull_secretly
    hands = @card.draw(1).flatten
    point = hands[1]
    puts 'カードを引いた'
    point
  end
end
