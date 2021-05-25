class ContractRepresenter
    def initialize(contracts)
        @contracts = contracts
    end


	def as_json
		@contracts.map do |contract|
			{
				id: contract.id,
				user_id: contract.user_id,
				customer_id: contract.customer_id,
				building_number: contract.building_number,
				description: contract.description,
				start_date: contract.start_date_shamsi,
				finish_date: contract.finish_date_shamsi,
				total_price: contract.total_price,
				address: contract.address,
				payment_type: contract.payment_type,
				stops: contract.stops,
				service_dept: contract.service_dept,
				contract_number: contract.contract_number,
				service_day: contract.service_day,
				lat: contract.lat,
				lng: contract.lng,
				dept: contract.dept,
				elevators: contract.elevators.to_json
			}
		end
	end
end