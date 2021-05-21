class LightContractSerializer < ActiveModel::Serializer
    attributes :id, :contract_number, :dept, :service_dept, :service_day
  
    belongs_to :customer,  serializer: SingleUserSerializer

    def service_dept
      object.service_dept
    end
  end
  