#class Buy3

#	attr_accessor :name
#	attr_accessor :type
#	attr_accessor :perf
#	attr_accessor :pri

	def buy1(you,items1,i1,i2,i3,i4,i5,i6)
		puts "***************************************************"
		puts "店主「ヘイラッシャイ」"
		puts "店主「#{you[:name]}さん、最近物騒だから、装備を整えた方がいいぜ」"

		loop do

			puts "***************************************************"
			puts "所持金#{you[:mn]}円"
			puts "***************************************************"
			puts "■アイテムリスト　番号で選んで下さい。(英数入力にして下さい)"

			index = 1

			items1.each do |item|
				puts "#{index}:#{item[:name]} (種類:#{item[:type]} 性能:#{item[:perf]} 値段:#{item[:pri]}円)"
				index += 1
			end
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
					you[:wp] = i2[:perf]
				else
					puts "お金が足り無いよ"
				end

			when 3 then
				if i3[:pri] <= you[:mn]
					puts "#{i3[:name]}を買いました"
					you[:mn] -= i3[:pri]
					you[:wp] = i3[:perf]
				else
					puts "お金が足り無いよ"
				end

			when 4 then
				if i4[:pri] <= you[:mn]
					puts "#{i4[:name]}を買いました"
					you[:mn] -= i4[:pri]
					you[:wp] = i4[:perf]
				else
					puts "お金が足り無いよ"
				end

			when 5 then
				if i5[:pri] <= you[:mn]
					puts "#{i5[:name]}を買いました"
					you[:mn] -= i5[:pri]
					you[:am] = i5[:perf]
				else
					puts "お金が足り無いよ"
				end

			when 6 then
				if i6[:pri] <= you[:mn]
					puts "#{i6[:name]}を買いました"
					you[:mn] -= i6[:pri]
					you[:am] = i6[:perf]
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

	def buy2(you,items2,i1,i2,i3,i4,i5,i6,i7,i8)
		puts "***************************************************"
		puts "店主「ヘイラッシャイ」"
		puts "店主「#{you[:name]}さん、他にも必要かい？」"

		loop do

			puts "***************************************************"
			puts "所持金#{you[:mn]}円"
			puts "***************************************************"
			puts "■アイテムリスト　番号で選んで下さい。(英数入力にして下さい)"

			index = 1

			items2.each do |item|
				puts "#{index}:#{item[:name]} (#{item[:type]} #{item[:perf]} #{item[:pri]}円)"
				index += 1
			end
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
					you[:wp] = i2[:perf]
				else
					puts "お金が足り無いよ"
				end

			when 3 then
				if i3[:pri] <= you[:mn]
					puts "#{i3[:name]}を買いました"
					you[:mn] -= i3[:pri]
					you[:wp] = i3[:perf]
				else
					puts "お金が足り無いよ"
				end

			when 4 then
				if i4[:pri] <= you[:mn]
					puts "#{i4[:name]}を買いました"
					you[:mn] -= i4[:pri]
					you[:wp] = i4[:perf]
				else
					puts "お金が足り無いよ"
				end

			when 5 then
				if i5[:pri] <= you[:mn]
					puts "#{i5[:name]}を買いました"
					you[:mn] -= i5[:pri]
					you[:am] = i5[:perf]
				else
					puts "お金が足り無いよ"
				end

			when 6 then
				if i6[:pri] <= you[:mn]
					puts "#{i6[:name]}を買いました"
					you[:mn] -= i6[:pri]
					you[:am] = i6[:perf]
				else
					puts "お金が足り無いよ"
				end

			when 7 then
				if i7[:pri] <= you[:mn]
					puts "#{i7[:name]}を買いました"
					you[:mn] -= i7[:pri]
					you[:wp] = i7[:perf]
				else
					puts "お金が足り無いよ"
				end

			when 8 then
				if i8[:pri] <= you[:mn]
					puts "#{i8[:name]}を買いました"
					you[:mn] -= i8[:pri]
					you[:am] = i8[:perf]
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

#end
