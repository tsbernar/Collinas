class Cart < ActiveRecord::Base
	has_many :cart_items
	has_one :order

	def add_item(menu_item_id)
		cart_item = CartItem.where('cart_id = ?', self.id).where('menu_item_id = ?', menu_item_id).first 
		if cart_item != nil
			cart_item.qty += 1
			cart_item.save
		else
			self.cart_items << CartItem.new(menu_item_id: menu_item_id, qty: 1)
		end
		save
	end

	def subtotal
		sub_total = 0
		items = self.cart_items
		items.each do |item|
			if item.menu_item.price
				sub_total += (item.qty * item.menu_item.price)
			end
		end
		sub_total
	end

	def tax
		tax_rate = BigDecimal('0.09')
		tax = subtotal * tax_rate
	end

	def total
		total = tax + subtotal
	end

	def size
		size = 0
		items = self.cart_items
		if items != nil
			items.each do |item|
				size += item.qty
			end
		else
			size = nil
		end
		size
	end

end
