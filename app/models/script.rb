# == Schema Information
#
# Table name: scripts
#
#  id         :integer          not null, primary key
#  book       :integer
#  chapter    :integer
#  line       :integer
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

class Script < ActiveRecord::Base
  include SearchCop

  scope :current_chapter, ->(book_id) { select('DISTINCT chapter').where(book: book_id).order(:chapter) }
  scope :current_script, ->(book_id, chapter_id) { select(:body).where(book: book_id, chapter: chapter_id).order(:id) }

  self.search_scope :search do
    attributes :body
  end

  def book_name(book_number)
    Book::BOOKS[book_number.to_s]
  end

  def self.create(a = {})
    puts "Saved record with: book: #{a[:book]}, chapter: #{a[:chapter]}, line: #{a[:line]}, body: #{a[:body]}"
  end

end
