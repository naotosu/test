def battle_m(you,mob,i1)

	puts "***************************************************"
	puts "#{mob[:name]}が現れた！　HP: #{mob[:HP]}"


	loop do
		if mob[:HP]<=0
			you[:mn] += mob[:mn]
			puts "***************************************************"
			return puts "#{mob[:name]}を倒した。#{mob[:mn]}円手に入れた"
		elsif you[:HP]<=0
			puts "***************************************************"		
			return puts "#{you[:name]}は死んでしまった"
		else

			#命中率判定入れたい

			puts "***************************************************"
			puts "#{you[:name]} HP: #{you[:HP]} MP: #{you[:MP]}"
			puts "1:攻撃  2:魔法(MP:5)  3:薬草 あと#{you[:ys]}つ(英数入力にして下さい)"
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
					puts("#{you[:name]}は#{i1[:perf]}回復した")
					you[:HP] += i1[:perf]
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
