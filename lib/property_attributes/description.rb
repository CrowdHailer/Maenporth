class Description
  Options = {autolink: true, tables: true}
  Renderer = Redcarpet::Markdown.new Redcarpet::Render::HTML, Options

  def initialize(raw)
    @raw = raw
  end

  attr_reader :raw

  def html
    @html ||= Renderer.render raw
  end

end
