class BookParser

  attr :url

  def initialize(url)
    @url = url
  end

  def chapters
    ch_count = Nokogiri::HTML(open(url))
    chapter_count = ch_count.css('.chapter').map do |ch|
      ChapterParser.new("http://wol.jw.org/pl/wol/b/r12/lp-p/bi12/P/1997/#{number}/#{ch.text}")
    end
  end

  def number
    File.basename(url)
  end

end
