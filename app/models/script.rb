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

  BOOKS = { 
    "1" => "Rodzaju", 
    "2" => "Wyjścia", 
    "3" => "Kapłańska", 
    "4" => "Liczb",
    "5" => "Powtórzonego Prawa",
    "6" => "Jozuego",
    "7" => "Sędziów",
    "8" => "Rut",
    "9" => "1 Samuela",
    "10" => "2 Samuela",
    "11" => "1 Królów",
    "12" => "2 Królów",
    "13" => "1 Kronik",
    "14" => "2 Kronik",
    "15" => "Ezdrasza",
    "16" => "Nehemiasza",
    "17" => "Estery",
    "18" => "Hioba",
    "19" => "Psalmy",
    "20" => "Przysłów",
    "21" => "Kaznodziei",
    "22" => "Pieśń",
    "23" => "Izajasza",
    "24" => "Jeremiasza",
    "25" => "Lamentacje",
    "26" => "Ezechiela",
    "27" => "Daniela",
    "28" => "Ozeasza",
    "29" => "Joela",
    "30" => "Amosa",
    "31" => "Abdiasza",
    "32" => "Jonasza",
    "33" => "Micheasza",
    "34" => "Nahuma",
    "35" => "Habakuka",
    "36" => "Sofoniasza",
    "37" => "Aggeusza",
    "38" => "Zachariasza",
    "39" => "Malachiasza",
    "40" => "Mateusza",
    "41" => "Marka",
    "42" => "Łukasza",
    "43" => "Jana",
    "44" => "Dzieje Apostolskie",
    "45" => "Rzymian",
    "46" => "1 Koryntian",
    "47" => "2 Koryntian",
    "48" => "Galatów",
    "49" => "Efezjan",
    "50" => "Filipian",
    "51" => "Kolosan",
    "52" => "1 Tesaloniczan",
    "53" => "2 Tesaloniczan",
    "54" => "1 Tymoteusza",
    "55" => "2 Tymoteusza",
    "56" => "Tytusa",
    "57" => "Filemona",
    "58" => "Hebrajczyków",
    "59" => "Jakuba",
    "60" => "1 Piotra",
    "61" => "2 Piotra",
    "62" => "1 Jana",
    "63" => "2 Jana",
    "64" => "3 Jana",
    "65" => "Judy",
    "66" => "Objawienia"
  }

  self.search_scope :search do
    attributes :body
  end

  def book_name(book_number)
    BOOKS[book_number.to_s]
  end

  def self.create(a = {})
    puts "Saved record with: book: #{a[:book]}, chapter: #{a[:chapter]}, line: #{a[:line]}, body: #{a[:body]}"
  end

end
