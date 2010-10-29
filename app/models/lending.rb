class Lending < ActiveRecord::Base
  belongs_to :entleiher
  belongs_to :buch

  def overdue?
    leihende <= DateTime.now
  end
end
