class Lending < ActiveRecord::Base
  belongs_to :entleiher
  belongs_to :buch

  def overdue?
    (not returned?) and leihende <= DateTime.now
  end

  
  
end
