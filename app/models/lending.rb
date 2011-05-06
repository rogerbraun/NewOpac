class Lending < ActiveRecord::Base
  belongs_to :entleiher
  belongs_to :buch
  
  validates_presence_of :buch_id, :entleiher_id
 
  def overdue?
    (not returned?) and leihende <= DateTime.now
  end
  
end
