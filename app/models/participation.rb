class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :resto
  has_many :feedbacks, dependent: :destroy

  def siblings
    Participation.where(resto_id: resto_id).where.not(id: id)
  end
end