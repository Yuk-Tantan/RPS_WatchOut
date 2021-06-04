# もう一度ゲームしますか？
@continue_or_not = 0
######______ ジャンケン ______######
def RPS_start
yield "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
yield "                                         "
yield "Rubyと「ジャンケン」&「あっち向いてホイ」"
@player_hand = 0
@program_hand = rand(1..3)
end

RPS_start do |play|
puts play
@player_hand
@program_hand
end

def serviced_hands
if @player_hand == 1
    yield "グー"
elsif @player_hand == 2
    yield "チョキ"
elsif @player_hand == 3
    yield "パー"
end
end

def recieved_hands
if @program_hand == 1
    yield "グー"
elsif @program_hand == 2
    yield "チョキ"
elsif @program_hand == 3
    yield "パー"
end
end

######______あっち向いてホイ______######
#上→１、下→２、左→３、右→４

@player_direction = 0
@program_direction = rand(1..4)

def serviced_direction
if @player_direction == 1
    yield "上(うえ)"
elsif @player_direction == 2
    yield "下(した)"
elsif @player_direction == 3
    yield "左(ひだり)"
elsif @player_direction == 4
    yield "右(みぎ)"
end
end

def recieved_direction
if @program_direction == 1
    yield "上(うえ)"
elsif @program_direction == 2
    yield "下(した)"
elsif @program_direction == 3
    yield "左(ひだり)"
elsif @program_direction == 4
    yield "右(みぎ)"
end
end

def watch_out_game
yield "-----------------------------------------"
yield "あっち向いて〜"
yield "上(1), 下(2), 左(3), 右(4)"
yield "-----------------------------------------"

@player_direction = gets.to_i
@program_direction = rand(1..4)
yield "ホイ！"
end

until @player_hand == 4
    while @player_hand != Numeric || @player_hand < 1 || @player_hand > 4
        puts "_________________________________________"
        puts "#########################################"
        puts "じゃんけん..."
        puts "グー(1), チョキ(2), パー(3), ゲームをやめる(4)"
        puts "上の番号から選んでね！"
        puts "-----------------------------------------"
        @player_hand = gets.to_i
        if @player_hand == @program_hand
            serviced_hands do |drow|
                puts "君の手は...#{drow}"
            end
            recieved_hands do |drow|
                puts "Rubyの手は...#{drow}"
            end
            puts "あいこだ..."
            @program_hand = rand(1..3)
            next
        elsif ((@player_hand == 1 && @program_hand == 2) || (@player_hand == 2 && @program_hand == 3) || (@player_hand == 3 && @program_hand == 1))
            serviced_hands do |win|
                puts "君の手は...#{win}"
            end
            recieved_hands do |lose|
                puts "Rubyの手は...#{lose}"
            end
            puts "君の番！！"

            # ジャンケンに勝ったので、playerのターン
            while @player_direction != Numeric || @player_hand < 1 || @player_hand > 4
                watch_out_game do |play|
                    puts play
                    @player_direction
                    @player_direction
                end
                if (@player_direction == @program_direction)
                    serviced_direction do |win|
                        puts ("君は...#{win}")
                    end
                    recieved_direction do |lose|
                        puts ("Rubyは...#{lose}")
                    end
                    puts "おめでとう! 君の勝ちだよ!"
                    break
                else
                    serviced_direction do |lose|
                        puts ("君は...#{lose}")
                    end
                    recieved_direction do |win|
                        puts ("Rubyは...#{win}")
                    end
                    puts "残念、君の負けだよ (>_<;)"
                    break
                end
                next
            end

            @program_hand = rand(1..3)
            next

        elsif ((@player_hand == 3 && @program_hand == 2) || (@player_hand == 1 && @program_hand == 3) || (@player_hand == 2 && @program_hand == 1))
            serviced_hands do |lose|
                puts "君の手は...#{lose}"
            end
            recieved_hands do |win|
                puts "Rubyの手は...#{win}"
            end
            puts "Rubyの番！！"

            #ジャンケンに負けたので、Rubyのターン
            while @player_hand != Numeric || @player_hand < 1 || @player_hand > 4
                watch_out_game do |play|
                    puts play
                    @player_direction
                    @player_direction
                end
                if (@player_direction == @program_direction)
                    serviced_direction do |lose|
                        puts ("君は...#{lose}")
                    end
                    recieved_direction do |win|
                        puts ("Rubyは...#{win}")
                    end
                    puts "残念、君の負けだよ (>_<;)"
                    break
                else
                    serviced_direction do |win|
                        puts ("君は...#{win}")
                    end
                    recieved_direction do |lose|
                        puts ("Rubyは...#{lose}")
                    end
                    puts "おめでとう! 君の勝ちだよ!"
                    break
                end
                next
            end

            @program_hand = rand(1..3)
            next

        elsif @player_hand == 4
            puts "またね!"
            break
        end
        next
    end
end

