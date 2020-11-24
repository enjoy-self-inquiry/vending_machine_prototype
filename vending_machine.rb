class Vendor
  puts "料金を入れてください。"
  puts "注意１：10円玉、50円玉、100円玉、500円玉、1,000円札しか受け付けません。"
  puts "注意２：それ以外の硬貨やお札を入れた場合はお返しします。"
  puts "注意３：複数回に分けて投入できます。"
  puts "注意４：投入が終わりましたら、readyと入力して下さい。"
  puts "それでは、まず投入回数を教えてください。"

 def input_reimburse
   input_nums = gets.to_i
   puts "それでは、#{input_nums}回、お金を入れてください。"
   @sum = 0

   input_nums.times do
     coin_or_bill = gets.to_i
     while true
       unless coin_or_bill == 10 || coin_or_bill == 50 || coin_or_bill == 100 || coin_or_bill == 500 || coin_or_bill == 1000
         puts "そのお金は受け付けられません。釣銭として#{coin_or_bill}円返します。"
         puts "再度、投入してください。"
         coin_or_bill = gets.to_i
       else
         @sum += coin_or_bill
         break
       end
     end
   end

   puts "投入金額合計は、#{@sum}円です。"
   puts "払戻す場合は、backと入力して下さい。"
   choice = gets.chomp

   if choice == "back"
     puts "#{@sum}円払い戻します。"
     @sum = 0
   else
     puts "それでは、購入に進みます。"
     return
   end
 end

end

class Inventory
  attr_accessor :price, :name, :nums
  def initialize(price, name, nums)
    @price = price
    @name = name
    @nums = nums
    puts "値段:#{@price}円, 名前:#{@name}, 在庫:#{@nums}本"
  end
end

vendor = Vendor.new
vendor.input_reimburse
inventory = Inventory.new(120, "コーラ", 5)
