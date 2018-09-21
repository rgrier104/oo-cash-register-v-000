class CashRegister

  attr_accessor :total, :discount, :last_amt

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
      self.total = @total + price*quantity
      @last_amt = price*quantity
      @title = title
      counter = 0
      while counter < quantity
        @items << title
        counter += 1
      end
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    else
      discount_total = self.total*self.discount/100.to_f
      @total = @total - discount_total.to_i
      return "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    self.total -= @last_amt
  end

end
