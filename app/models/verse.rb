class Verse < ActiveRecord::Base
  include SearchCop

  validates :title, :description, :label, presence: true
  validates :title, uniqueness: true
  validates :description, length: { maximum: 120, too_long: 'Description cannot be more than 120 characters' }
  validates :label, length: { maximum: 20, too_long: 'Label cannot be more than 20 characters' }


  self.search_scope :search do
    attributes :title, :description, :label
  end

  belongs_to :user

end
