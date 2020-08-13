#require "./buy1"
#require "./battle_m"

#メソッドを外部ファイルから読み込みにしたい　オブジェクト指向

you = {name: "" , maxHP: 50, HP: 50, MP: 20, str: 3, agi: 3, agip: 0,vit: 3, int: 20, dex: 3,wp: 0,am: 0,mn: 2000,ys: 0}
mob1 = {name:"凸<スライム", maxHP: 50, HP:50, MP:20, str: 2, agi:3, agip: 0, vit: 1, int: 0, dex:1, mn: 50}
mob2 = {name:"皿<ブルーアイズ(以下略)", maxHP: 70, HP:70, MP:20, str:6 , agi:4, agip: 0, vit: 4, int: 5, dex:5, mn: 10000}
mob = mob1

#アイテムを配列化したい

i1 = {name: "薬草", hp: 20, pri: 200}
i2 = {name: "鋼の剣", wp: 2, pri: 800}
i3 = {name: "鼻毛の剣", wp: -2, pri: 50}
i4 = {name: "菊一文字", wp: 5, pri: 1800}
i5 = {name: "革の盾", am: 2, pri: 500}
i6 = {name: "鋼の盾", am: 4, pri:800}


def buy(you,i1,i2,i3,i4,i5,i6)
	puts "***************************************************"
	puts "店主「ヘイラッシャイ」"
	puts "店主「#{you[:name]}さん、最近物騒だから、装備を整えた方がいいぜ」"

	loop do

		puts "***************************************************"
		puts "所持金#{you[:mn]}円"
		puts "***************************************************"
		puts "■アイテムリスト　番号で選んで下さい。"
		puts "1:#{i1[:name]}（HP#{i1[:hp]}回復 #{i1[:pri]}円)"
		puts "2:#{i2[:name]} (攻撃力+#{i2[:wp]} #{i2[:pri]}円)"
		puts "3:#{i3[:name]} (攻撃力#{i3[:wp]} #{i3[:pri]}円)"
		puts "4:#{i4[:name]} (攻撃力+#{i4[:wp]} #{i4[:pri]}円)"
		puts "5:#{i5[:name]} (防御力+#{i5[:am]} #{i5[:pri]}円)"
		puts "6:#{i6[:name]} (防御力+#{i6[:am]} #{i6[:pri]}円)"
		puts "上記以外:店を出る"
		puts "***************************************************"
		
		bu = gets.chomp.to_i

		case bu
		when 1 then
			if i1[:pri] <= you[:mn]
				puts "薬草を買いました"
				you[:mn] -= i1[:pri]
				you[:ys] += 1
			else
				puts "お金が足り無いよ"
			end

		when 2 then
			if i2[:pri] <= you[:mn]
				puts "#{i2[:name]}を買いました"
				you[:mn] -= i2[:pri]
				you[:wp] = i2[:wp]
			else
				puts "お金が足り無いよ"
			end

		when 3 then
			if i3[:pri] <= you[:mn]
				puts "#{i3[:name]}を買いました"
				you[:mn] -= i3[:pri]
				you[:wp] = i3[:wp]
			else
				puts "お金が足り無いよ"
			end

		when 4 then
			if i4[:pri] <= you[:mn]
				puts "#{i4[:name]}を買いました"
				you[:mn] -= i4[:pri]
				you[:wp] = i4[:wp]
			else
				puts "お金が足り無いよ"
			end

		when 5 then
			if i5[:pri] <= you[:mn]
				puts "#{i5[:name]}を買いました"
				you[:mn] -= i5[:pri]
				you[:am] = i5[:am]
			else
				puts "お金が足り無いよ"
			end

		when 6 then
			if i6[:pri] <= you[:mn]
				puts "#{i6[:name]}を買いました"
				you[:mn] -= i6[:pri]
				you[:am] = i6[:am]
			else
				puts "お金が足り無いよ"
			end

		else
			puts "店主「毎度あり！」"
			puts "***************************************************"
			break
		end
		
	end
end




def battle_m(you,mob,i1)

	puts "***************************************************"
	puts "#{mob[:name]}が現れた！　HP: #{mob[:HP]}"


	loop do
		if mob[:HP]<=0
			you[:mn] = mob[:mn]
			puts "***************************************************"
			return puts "#{mob[:name]}を倒した。#{mob[:mn]}円手に入れた"
		elsif you[:HP]<=0
			puts "***************************************************"		
			return puts "#{you[:name]}は死んでしまった"
		else

			#命中率判定入れたい

			puts "***************************************************"
			puts "#{you[:name]} HP: #{you[:HP]} MP: #{you[:MP]}"
			puts "1:攻撃  2:魔法(MP:5)  3:薬草 あと#{you[:ys]}つ"
			at = gets.chomp.to_i

			you[:agip] = rand(3)
			mob[:agip] = rand(3)
			dmg = 0

			if (you[:agi] + you[:agip]) < (mob[:agi] + mob[:agip])
				puts "#{mob[:name]}の攻撃！！"
				dmg = (mob[:str] + rand(3)) - (you[:vit] + you[:am] + rand(3))

				if dmg <= 0
					dmg = 1
				end

				puts "#{you[:name]}は#{dmg}のダメージ"
				you[:HP] -= dmg 
			else

			end

			case at
			when 1 then
				puts("#{you[:name]}の攻撃！！")

				dmg = (you[:str] + you[:wp] + rand(3)) - (mob[:vit] + rand(3))

				if dmg <= 0
					dmg = 1
				end

				puts("#{mob[:name]}は#{dmg}のダメージ")
				mob[:HP] -= dmg

			when 2 then
				if you[:MP] < 5
					puts "MPが足り無い！"
					next
				else	
					puts("#{you[:name]}は魔法を唱えた！！")
					dmg = (you[:int] + rand(3)) - (mob[:int] + rand(3))

					if dmg <= 0
						dmg = 1
					end

					puts("#{mob[:name]}は#{dmg}のダメージ")
					mob[:HP] -= dmg
					you[:MP] -= 5
				end
				

			when 3  then
				if you[:ys] == 0
					puts "薬草が無い！"
					next
				else					
					puts("#{you[:name]}は薬草を使った")
					puts("#{you[:name]}は#{i1[:hp]}回復した")
					you[:HP] += i1[:hp]
					you[:ys] -= 1

					if you[:maxHP] < you[:HP]
						you[:HP] = you[:maxHP]
					end

				end
			else
				puts("#{you[:name]}は何もしなかった！！")


			end

			if (you[:agi] + you[:agip]) >= (mob[:agi] + mob[:agip])
				puts "#{mob[:name]}の攻撃！！"
				dmg = (mob[:str] + rand(3)) - (you[:vit] + you[:am] + rand(3))

				if dmg <= 0
					dmg = 1
				end

				puts "#{you[:name]}は#{dmg}のダメージ"
				you[:HP] -= dmg 
			else
				
			end

		puts("#{mob[:name]} HP:#{mob[:HP]}")
		end
	end
end


puts "あなたのあなたの名前を教えて下さい"

you[:name] = gets.chomp

buy(you,i1,i2,i3,i4,i5,i6)

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

mob = mob2
battle_m(you,mob,i1)

if you[:HP] <= 0
	return puts "GAME OVER"
else
	return puts "おめでとうございます！ゲームクリアです！"
end