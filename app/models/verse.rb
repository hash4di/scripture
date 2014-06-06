class Verse < ActiveRecord::Base
  validates :title, :description, :label, presence: true
  validates :title, uniqueness: true
  validates :description, length: { maximum: 120, too_long: 'Description cannot be more than 120 characters' }
  validates :label, length: { maximum: 20, too_long: 'Label cannot be more than 20 characters' }

  belongs_to :user
end
