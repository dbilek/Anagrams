class Anagrams
  attr_accessor :anagrams_wordlist, :test_file

  def initialize
    self.anagrams_wordlist = "anagrams_wordlist/anagrams-wordlist.txt"
    self.test_file = "anagrams_wordlist/test_file.txt"
  end

  def find_anagrams(anagrams_wordlist)
    anagrams_wordlist = read_file(anagrams_wordlist)

    get_hash_with_anagrams(anagrams_wordlist)
  end

  private

    def get_hash_with_anagrams(anagrams_wordlist)
      hash = Hash.new()
      anagrams_wordlist.each do |line|
        
        key = line.downcase.split("").sort.join
        
        if hash.has_key?(key)
          hash[key] << line
        else
          hash[key] = [line]
        end

      end

      hash

    end

    def read_file(file)
      utf8_encode(IO.read(file)).split("\n")
    end  

    def utf8_encode(line_from_file)
      line_from_file.encode("UTF-16be", :invalid=>:replace, :replace=>"?").encode('UTF-8')
    end
end