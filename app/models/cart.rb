class Cart < ActiveRecord::Base
	has_many :cart_items

	def add_item(menu_item_id,cart)
		cart_item = CartItem.where('cart_id = ?', cart.id).where('menu_item_id = ?', menu_item_id).first 
		if cart_item != nil
			cart_item.qty += 1
			cart_item.save
		else
			cart.cart_items << CartItem.new(menu_item_id: menu_item_id, qty: 1)
		end
		save
	end

end
