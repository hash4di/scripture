class ChapterParser
  attr :url
  attr :number

  def initialize(url)
    @url = url
  end

  def lines
    page = Nokogiri::HTML(open(url))
    i=0
    page.xpath("//div[contains(@class, 'par')]//span").map do |node|
      body = node.content.strip.tap do |out|
        while nn = node.next
          break if nn.name == 'span'
          out << ' ' << nn.content.strip if nn.text? && !nn.content.strip.empty?
          node = nn
        end
      end
      i+=1
      LineSource.new(body, book_num, number, i)
    end
  end

  def book_num
    File.basename(File.dirname(url))
  end

  def number
    File.basename(url)
  end
end
