module PostHelper
  require "kramdown"

  def parse(content)
    raw Kramdown::Document.new(content).to_html
  end
end
