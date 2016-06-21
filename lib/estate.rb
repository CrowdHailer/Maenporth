class Estate < Errol::Repository
  class Inquiry < Errol::Inquiry
    default :for_sale_only, false
    default :for_rent_only, false
    default :page, 1
    default :page_size, 15
  end

  class << self
    def record_class
      Property::Record
    end

    def inquiry(requirements)
      Inquiry.new requirements
    end

    def for_rent
      all :for_rent_only => true
    end

    def for_sale
      all :for_sale_only => true
    end

    def dispatch(record)
      # DEBT wrap in entity
      record
    end

    def receive(entity)
      entity
    end
  end

  def dataset
    # DEBT errol allow no dataset method
    tmp = raw_dataset

    if inquiry.for_rent_only
      tmp = tmp.exclude(:for_rent => false)
    end

    if inquiry.for_sale_only
      tmp = tmp.exclude(:for_sale => false)
    end
    tmp.order :id
    tmp
  end
end
