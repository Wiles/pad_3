# To change this template, choose Tools | Templates
# and open the template in the editor.

puts "Hello World"
class Element
  
  attr_reader :elements, :metadata, :name
  
  def initilize()
   @name = ""
   @elements = Array.new
   @metadata = Hash.new
  end

  def [] (element)
    if element.is_a?(Numerical)
      if element < 0 || element >= @elements.length
        return nil
      end
      return @elements[element]
    elsif element.is_a?(String)
      elm_list = Array.new
      for e in @elements
        if e.name == element
          elm_list = elm_list + [e]
        end
      end
      return elm_list
    end
  end

end