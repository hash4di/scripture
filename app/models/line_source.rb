class LineSource
  attr_reader :body, :book_num, :chapter_num, :line_num

  def initialize(body, book_num, chapter_num, line_num)
    @body = body
    @book_num = book_num
    @chapter_num = chapter_num
    @line_num = line_num
  end
end
