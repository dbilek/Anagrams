class Anagram
  attr_accessor :wordlist

  def initialize(filename)
    @wordlist = check_type(filename)
  end

  def find_anagrams
    anagrams_list = Hash.new []
    
    @wordlist.each do |line|
      key = sort_and_validate(line)
      
      anagrams_list[key] += [line] if more_than_one_char?(line)
    end
    
    get_unique_remove_nonanagram(anagrams_list)
  end

  def read_anagrams(anagrams)
    
    anagrams.each do |result|
      puts result.join(" ")
    end

  end

  private
    
    def get_unique_remove_nonanagram(anagrams_list)
      anagrams_result = []
      
      anagrams_list.each do |key, word_list|
        word_list = word_list.uniq
        anagrams_result << word_list if word_list.size > 1
      end

      anagrams_result
    end

    def check_type(filename)
      if filename.respond_to?(:to_a)
        filename
      else
        read_file(filename)
      end
    end

    def more_than_one_char?(line)
      line.size > 1
    end

    def sort_and_validate(line)
      line.downcase.split("").sort.join.gsub(/\W+/,'').strip
    end

    def read_file(file)
      IO.read(file).encode("UTF-8", :invalid=>:replace, :replace=>"").split("\n")
    end  

end