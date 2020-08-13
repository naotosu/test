you = {name: "" ,HP: 50, MP: 20, str: 3, vit: 3, int: 20}
mob1 = {name:"スライム", HP:50, MP:20, str: 7, vit: 1}

puts "あなたのあなたの名前を教えて下さい"

you[:name] = gets.chomp

puts "頼もしい「#{you[:name]}」さん、お願いがあります。"
puts "#{mob1[:name]}が暴れています。どうか倒してきて下さい。"


puts "凸<#{mob1[:name]}が現れた！　HP: #{mob1[:HP]}"

while you[:HP] > -100 do
	if mob1[:HP]<=0
		return puts "スライムを倒した"
	elsif you[:HP]<=0		
		return puts "#{you[:name]}は死んでしまった"
	else
		puts "#{you[:name]} HP: #{you[:HP]} MP: #{you[:MP]}"
		puts "1:攻撃  2:魔法(MP:5)  3:薬草"
		at = gets.chomp

		case at
		when "1" then
			puts("#{you[:name]}の攻撃！！")
			puts("#{mob1[:name]}は#{you[:str] - mob1[:vit]}のダメージ")
			mob1[:HP] = mob1[:HP] - (you[:str] - mob1[:vit])
			puts("#{mob1[:name]}の攻撃！！")
			puts("#{you[:name]}は#{mob1[:str] - you[:vit]}のダメージ")
			you[:HP] = you[:HP] - (mob1[:str] - you[:vit])
		when "2" then
			puts("#{you[:name]}は魔法を唱えた！！")
			puts("#{mob1[:name]}は#{you[:int]}のダメージ")
			mob1[:HP] = mob1[:HP] - you[:int]
			you[:MP] = you[:MP] - 5
			puts("#{mob1[:name]}の攻撃！！")
			puts("#{you[:name]}は#{mob1[:str] - you[:vit]}のダメージ")
			you[:HP] = you[:HP] - (mob1[:str] - you[:vit])
			

		when "3"  then
			puts("#{you[:name]}は薬草を使った")
			puts("#{you[:name]}は20回復した")
			you[:HP] = you[:HP] + 20
			puts("#{mob1[:name]}の攻撃！！")
			puts("#{you[:name]}は#{mob1[:str]}のダメージ")
			you[:HP] = you[:HP] - mob1[:str]
		else
			puts("#{you[:name]}は何もしなかった！！")
			puts("#{mob1[:name]}の攻撃！！")
			puts("#{you[:name]}は#{mob1[:str]}のダメージ")
			you[:HP] = you[:HP] - mob1[:str]
		end

	puts("#{mob1[:name]} HP:#{mob1[:HP]}")
	end
end
