# frozen_string_literal: true

class GameControl
  require './players'
  require './card'
  def initialize
    @score_of_player = 0
    @score_of_dealer = 0
    card = Card.new
    @players = Players.new(card)
    puts 'あなたのターン'
    add_your_score
    add_your_score
    print "#{show_your_score}\nディーラーのターン\n"
    add_dealer_score
    add_dealer_score_secretly
  end

  def run
    while continue?
    end
    puts 'ディーラーは以下のカードを引きました'
    add_dealer_score while @score_of_dealer < 17
    print "あなたの得点：#{@score_of_player}\nディーラーの得点：#{@score_of_dealer}\n"
    judge
  end

  private

  def judge
    if @score_of_dealer > 21
      puts 'バースト！ディーラーの負け'
    elsif @score_of_player > @score_of_dealer
      puts 'あなたの勝ち'
    else
      puts 'あなたの負け'
    end
  end
  
  def continue?
    puts 'カードを引きますか[y/n]'
    line = gets.to_s
    if line =~ /[Yy]/
      add_your_score
      show_your_score
      if @score_of_player > 21
        puts 'バースト！あなたの負け'
        exit
      end
      return true
    elsif line =~ /[Nn]/
      puts '結果発表'
      return false
    else
      puts '[y/n]で入力してください'
      continue?
    end
  end

  def add_your_score
    score = @players.pull
    @score_of_player += if score > 9
                        10
                      else
                        score
                      end
  end

  def add_dealer_score
    score = @players.pull
    @score_of_dealer += if score > 9
                        10
                      else
                        score
                      end
  end

  def add_dealer_score_secretly
    score = @players.pull_secretly
    @score_of_dealer += if score > 9
                        10
                      else
                        score
                      end
  end

  def show_your_score
    print "現在のあなたの得点は#{@score_of_player}です。"
  end

end
