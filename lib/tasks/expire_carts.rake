namespace :carts do
	desc "Destroys all expired carts, (expired time defined in Cart model)"
	task :expire_carts => :environment do
		expired_carts = Cart.expired
		expired_carts.each { |cart| cart.destroy}
	end

end