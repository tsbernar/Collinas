
## use for production 
Braintree::Configuration.environment  = ENV['BRAINTREE_ENV']        
Braintree::Configuratio.merchant_id   = ENV['BRAINTREE_MERCHANT_ID'] 
Braintree::Configuration.public_key   = ENV['BRAINTREE_PUBLIC_KEY']  
Braintree::Configuration.private_key  = ENV['BRAINTREE_PRIVATE_KEY'] 