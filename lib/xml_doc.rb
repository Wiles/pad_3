
require 'element'

class XML_Doc
  attr_accessor :root
  def initilize
    @root = Element.new
    @version = ""
  end
end