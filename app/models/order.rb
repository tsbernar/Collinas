class Order < ActiveRecord::Base
	belongs_to :cart
	validates :name, presence: true, length: { maximum: 30 }

	def self.search(search)
		if search
			Order.where('cast(id as text) ILIKE ? OR name ILIKE ?', "%#{search}%", "%#{search}%")
		else
			Order.all
		end
	end

	def receipt
		Receipts::Receipt.new(
			id: id,
			product: "Order ##{id}",
			company: {
				name: "FoodHaus Cafe",
				address: "2106 S Olive St, Los Angeles, CA 90007",
				phone: "213-741-0007",
				email: "trevor.s.bernard@gmail.com",
				logo: Rails.root.join("app/assets/images/logo.png")
			},
			line_items: line_items
			)
	end

	def send_notification
		#todo: get email address from order, send an email with receipt
	end

	def line_items 
		i = 0 
		cart_items = self.cart.cart_items
		items = [
				["Date", created_at.strftime("%m/%d/%Y %l:%M%P")]
			]
		while i < cart_items.length do
			items << ["#{cart_items[i].menu_item.name}(#{cart_items[i].qty})", helpers.number_to_currency(cart_items[i].menu_item.price*cart_items[i].qty)]
			i += 1
		end
			items << ["Sub Total", helpers.number_to_currency(cart.subtotal)]
			items << ["Tax", helpers.number_to_currency(cart.tax)]
			items << ["Total", helpers.number_to_currency(cart.total)]
			items
	end

	def helpers 
		ActionController::Base.helpers
	end

end
