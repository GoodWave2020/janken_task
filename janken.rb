class Player
  def hand
    puts "数字を入力してください。"
    puts "0:グー, 1:チョキ, 2:パー"
    input_hand = gets
      while true
        # 正規表現を使って整数かどうかを判断しました
        if /^[0-9]+$/ =~ input_hand.to_s && (input_hand.to_i == 0 || input_hand.to_i == 1 || input_hand.to_i == 2)
          return input_hand.to_i
        else
          puts "もう一度数字を入力してください。"
          puts "0:グー, 1:チョキ, 2:パー"
          input_hand = gets
        end
      end
  end
end

class Enemy
  def hand
    return rand(3)
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    janken = ["グー", "チョキ", "パー"]
    puts "相手の手は#{janken[enemy_hand]}です。"
      if player_hand == enemy_hand
        puts "あいこ"
        return true
      elsif (player_hand == 0 && enemy_hand == 1) || (player_hand == 1 && enemy_hand == 2) || (player_hand == 2 && enemy_hand == 0)
        puts "あなたの勝ちです"
        return false
      else
        puts "あなたの負けです"
        return false
      end
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new
next_game = true

while next_game == true
  next_game = janken.pon(player.hand, enemy.hand)
end
