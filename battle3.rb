require "./buy3"
require "./battle_m3"

you = {name: "" , maxHP: 50, HP: 50, MP: 20, str: 3, agi: 3, agip: 0,vit: 3, int: 20, dex: 3,wp: 0,am: 0,mn: 2000,ys: 0}
mob1 = {name:"凸<スライム", maxHP: 30, HP:30, MP:20, str: 2, agi:3, agip: 0, vit: 1, int: 0, dex:1, mn: 4000}
mob2 = {name:"皿<ドラゴン", maxHP: 100, HP:100, MP:20, str:14 , agi:4, agip: 0, vit: 10, int: 5, dex:5, mn: 10000}
mob = mob1

i1 = {name: "薬草", type: "回復アイテム", perf: 20, pri: 100}
i2 = {name: "鋼の剣", type: "武器", perf: 2, pri: 800}
i3 = {name: "メリケンサック", type: "武器", perf: 3, pri: 1000}
i4 = {name: "菊一文字", type: "武器", perf: 5, pri: 1800}
i5 = {name: "革の盾", type: "盾", perf: 2, pri: 500}
i6 = {name: "鋼の盾", type: "盾", perf: 4, pri: 800}
i7 = {name: "侍ブレード", type: "武器", perf: 8, pri: 2000}
i8 = {name: "精霊の盾", type: "盾", perf: 8, pri: 2000}


#インスタンスメソッド化したい

#i1 = Buy3.new(name: "薬草", type: "回復アイテム", perf: 20, pri: 100)
#i2 = Buy3.new(name: "鋼の剣", type: "武器", perf: 2, pri: 800)
#i3 = Buy3.new(name: "鼻毛の剣", type: "武器", perf: -2, pri: 50)
#i4 = Buy3.new(name: "菊一文字", type: "武器", perf: 5, pri: 1800)
#i5 = Buy3.new(name: "革の盾", type: "盾", perf: 2, pri: 500)
#i6 = Buy3.new(name: "鋼の盾", type: "盾", pref: 4, pri:800)

items1 = [i1,i2,i3,i4,i5,i6]


puts "あなたのあなたの名前を教えて下さい(かな入力にして下さい)"

you[:name] = gets.chomp

buy1(you,items1,i1,i2,i3,i4,i5,i6)

puts "***************************************************"
puts "外が騒がしい！モンスターだ！"
puts "***************************************************"
puts "村人A「助けて！#{you[:name]}」さん！"
puts "#{mob[:name]}が暴れています！"
puts "***************************************************"

battle_m(you,mob,i1)

if you[:HP] <= 0
	return puts "GAME OVER"
end

puts "村人B「まだいるぞー！」"
puts "村人C「次は強敵だ。もう一度アイテムを見直した方が良いぜ？"

items2 =  [i1,i2,i3,i4,i5,i6,i7,i8]

buy2(you,items2,i1,i2,i3,i4,i5,i6,i7,i8)

puts "村人C「準備はいいか？頼むぜ・・・」"

mob = mob2

battle_m(you,mob,i1)

if you[:HP] <= 0
	return puts "GAME OVER"
else
	return puts "おめでとうございます！ゲームクリアです！"
end
