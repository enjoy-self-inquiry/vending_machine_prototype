class Vendor
  attr_accessor :money, :sales, :name, :price, :inventory
  ACCEPTABLE_INPUT = [10, 50, 100, 500, 1000].freeze

  def initialize(money, sales, name, price, inventory)
    @money = 0
    @sales = 0
    @name = name
    @price = price
    @inventory = inventory
  end

  def input
    inputs = gets.to_i
    ACCEPTABLE_INPUT.include?(inputs) ? @money += inputs : "想定外のお金です。釣銭として#{inputs}円返します。"
  end

  def reimburse
    puts "#{@money}円返します"
    @money = 0
  end

  def buy
    if @inventory > 0
      if @money >= @price
        puts "１本購入します。"
        @inventory -= 1
        @sales += @price
        @money -= @price
        puts "#{@money}円のお釣りです。"
        @money = 0
      else
        puts "お金が足りません。"
      end
    else
        puts "在庫がありません。"
    end
  end

  def buyable
    if @inventory > 0 && @money >= @price
      return "#{@name}を買うことができます。（在庫：#{@inventory}本）"
    end
  end

end
