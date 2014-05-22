class Verse < ActiveRecord::Base
  validates :title, :description, :label, presence: true
end
