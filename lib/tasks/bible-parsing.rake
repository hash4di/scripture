require 'open-uri'

task :bible_parsing => :environment do
  books = 1.upto(66).map { |book_num| BookParser.new("http://wol.jw.org/pl/wol/binav/r12/lp-p/bi12/P/1997/#{book_num}") }

  books.each do |book|
    book.chapters.each do |chapter|
      chapter.lines.each do |line_source|
        Script.create!(book: book.number, chapter: chapter.number, line: line_source.line_num, body: line_source.body)
      end
    end
  end

end
