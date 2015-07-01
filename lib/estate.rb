class Estate < Errol::Repository
  class Inquiry < Errol::Inquiry
    default :for_sale, true
    default :for_rent, true
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
      all :for_sale => false
    end

    def for_sale
      all :for_rent => false
    end

    def dispatch(record)
      # TODO wrap in model
      # TODO allow errol to reurn records
      record
    end

    def receive(entity)
      entity
    end
  end

  def dataset
    # TODO errol allow no dataset method
    tmp = raw_dataset

    unless inquiry.for_sale
      tmp = tmp.exclude(:for_sale => true)
    end

    unless inquiry.for_rent
      tmp = tmp.exclude(:for_rent => true)
    end
    tmp
  end
end
