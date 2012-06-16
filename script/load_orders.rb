Order.transaction do 
	(1..100).each do |i|
		Order.create :name => "Custumer #{i}", :address => "#{i} Main Street", :email => "custumer#{i}@example.com", :pay_type => "Check"
	end
end