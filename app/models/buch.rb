#encoding: utf-8
class IsIsbnValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless value.length == 10 or value.length == 13 then 
      object.errors[attribute] << (options[:message] || "is not formatted properly") 
    end
  end
end
class IsSignatureValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless value == "Signatur folgt" or value =~ /[\dH\-\.]/
      object.errors[attribute] << (options[:message] || "ist keine gültige Signatur") 
    end
  end
end

class Buch < ActiveRecord::Base

  cattr_reader :per_page
  @@per_page = 10

  validates :isbn, :is_isbn => true
  validates :signatur, :is_signature => true
  has_many :lendings
  has_many :attachments

  def complete_signature
    "#{self.signatur} #{self.nebensignatur}"
  end

  def entliehen?
    !!current_lending 
  end

  def current_lending
    lendings.select{|el| el.returned == false}.first
  end
  
end
