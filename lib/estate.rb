class Estate < Errol::Repository
  class Inquiry < Errol::Inquiry
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
    raw_dataset
    # raw_dataset.order :title
  end
end
