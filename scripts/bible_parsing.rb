#utf-8
require 'rubygems'
require 'nokogiri'
require 'open-uri'


#url_chapter_count = "http://wol.jw.org/pl/wol/binav/r12/lp-p/bi12/P/1997/20"
#url_verses_count = "http://wol.jw.org/pl/wol/binav/r12/lp-p/bi12/P/1997/20"

#def books_count
  #url_books_count = "http://wol.jw.org/pl/wol/binav/r12/lp-p/bi12/P/1997"
  #b_count = Nokogiri::HTML(open(url_books_count))
  #books_count = b_count.css('.book').map do |b|
    #b.text
  #end
#end

#def chapter_count
  #ch_count = Nokogiri::HTML(open("http://wol.jw.org/pl/wol/binav/r12/lp-p/bi12/P/1997/20"))
  #chapter_count = ch_count.css('.chapter').map do |ch|
    #ch.text
  #end
  #puts chapter_count.length
#end


#def books_link_generator
  #1.upto(books_count.length) do |booksnum|
    #books_url ="http://wol.jw.org/pl/wol/binav/r12/lp-p/bi12/P/1997/#{booksnum}"
    #puts books_url
  #end
#end

#def chapter_count
  #ch_count = Nokogiri::HTML(open(books_url))
  #chapter_count = ch_count.css('.chapter').map do |ch|
    #ch.text
  #end
  #puts chapter_count
#end

#ch_count = Nokogiri::HTML(open("#{books_link_generator}"))
#chapter_count = ch_count.css('.chapter').map do |ch|
  #ch.text
#end
#print chapter_count

#1.upto(chapter_count.length) do |pagenum|
  #url ="http://wol.jw.org/pl/wol/b/r12/lp-p/bi12/P/1997/20/#{pagenum}"
  #puts url
#end

#def verses
  #page = Nokogiri::HTML(open(url))
  #page.xpath('//p/text()').each do |node|
    #puts node.text
  #end
#end

class VerseSource
  attr_reader :body, :book_num, :chapter_num, :verse_num

  def initialize(body, book_num, chapter_num, verse_num)
    @body = body
    @book_num = book_num
    @chapter_num = chapter_num
    @verse_num = verse_num
  end
end

class Chapter
  attr :url
  attr :number

  def initialize(url)
    @url = url
  end

  def verses
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
      VerseSource.new(body, book_num, number, i)
    end
  end

  def book_num
    File.basename(File.dirname(url))
  end

  def number
    File.basename(url)
  end
end

class Book

  attr :url
  attr :name

  def initialize(url)
    @url = url
  end

  def chapters
    ch_count = Nokogiri::HTML(open(url))
    chapter_count = ch_count.css('.chapter').map do |ch|
      Chapter.new("http://wol.jw.org/pl/wol/b/r12/lp-p/bi12/P/1997/#{number}/#{ch.text}")
    end
  end

  def number
    File.basename(url)
  end

end

class Verse # < ActiveRecord::Base
  def self.create!(a = {})
    puts "Saved record with: book: #{a[:book]}, chapter: #{a[:chapter]}, verse: #{a[:verse]}, body: #{a[:body]}"
  end
end

books = 1.upto(66).map { |book_num| Book.new("http://wol.jw.org/pl/wol/binav/r12/lp-p/bi12/P/1997/#{book_num}") }

books.each do |book|
  book.chapters.each do |chapter|
    chapter.verses.each do |verse_source|
      Verse.create!(book: book.number, chapter: chapter.number, verse: verse_source.verse_num, body: verse_source.body)
    end
  end
end

#page = Nokogiri::HTML(open("http://wol.jw.org/pl/wol/b/r12/lp-p/bi12/P/1997/1/1"))
#x = page.css("p").text.gsub("+", " ").split.join(" ").gsub(". ", ". HAM").split(" HAM")
#puts x
