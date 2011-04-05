# Ill Formed XML
class IllFormedXMLException < Exception

  # message [string] - Exception details
  def initialize(message = "")
    super(message)
  end
end
