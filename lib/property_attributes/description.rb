# Also handles review
class Description
  Options = {autolink: true, tables: true}
  Renderer = Redcarpet::Markdown.new Redcarpet::Render::HTML, Options
  class << self
    def dump(item)
      # DEBT test
      item.raw
    end
  end

  def initialize(raw)
    @raw = raw
  end

  attr_reader :raw

  def html
    @html ||= Renderer.render raw
  end

  def ==(other)
    if other.respond_to? :raw
      # DEBT test more
      raw == other.raw
    end
  end

end
