# == Schema Information
#
# Table name: verses
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  label       :string(255)
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Verse < ActiveRecord::Base
  include SearchCop

  validates :title, :description, :label, presence: true
  validates :title, :uniqueness => {:scope=>:user_id}
  validates :label, length: { maximum: 20, too_long: "Label can't be more than 20 characters" }


  self.search_scope :search do
    attributes :title, :description, :label
  end

  belongs_to :user

end
