class IsIsbnValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless value.length == 10 or value.length == 13 then 
      object.errors[attribute] << (options[:message] || "is not formatted properly") 
    end
  end


end

class Buch < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 10

  validates :isbn, :is_isbn => true
  has_many :lendings
end
