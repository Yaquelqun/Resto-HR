class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :resto

  def siblings
    Participation.where(resto_id: resto_id).where.not(id: id)
  end
end