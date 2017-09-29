#require 'pry'
class Anagrams

  def initialize
    @counter = 0
    IO.copy_stream "anagrams_worldlist/chosen_word.txt", "anagrams_worldlist/chosen_word_copy.txt"
    @anagrams_worldlist = "anagrams_worldlist/chosen_word_copy.txt"
    @anagrams_temporary = "anagrams_worldlist/temporary_file.txt"
    
  end

  def find_anagrams
    @anagrams_list = []
    @counter += 1
    line_for_search = ""

    File.foreach(@anagrams_worldlist).with_index do |line, index|
      if first_line?(index)
        line_for_search = line.chomp
      end
      #binding.pry
      find_anagrams_words(line_for_search, line)
    end

    puts  @anagrams_list.join(" ")
    IO.copy_stream @anagrams_temporary, @anagrams_worldlist
    File.truncate(@anagrams_temporary, 0)
    
    find_anagrams unless File.zero?(@anagrams_worldlist)
    @anagrams_list
  end


  def find_anagrams_words(line_for_search, line)
    line = utf8_encode(line).chomp 
    if same_size?(line, line_for_search)
      if matched_character_same_size?(line_for_search, line)
        @anagrams_list << line
      else
        write_line_to_file(@anagrams_temporary, line)
      end
    else
      write_line_to_file(@anagrams_temporary, line)
    end
  end

  private
  
    def write_line_to_file(file, word)
      File.open(file, "a") do |write|
        write.puts word
      end
    end

    def first_line?(index)
      index == 0
    end

    def utf8_encode(line_from_file)
      line_from_file.encode("UTF-16be", :invalid=>:replace, :replace=>"?").encode('UTF-8')
    end

    def same_size?(line_from_file, word_from_input)
      line_from_file.size == word_from_input.size
    end

    def matched_character_same_size?(word_from_input, line_from_file)
      word_from_input.scan(/[#{line_from_file.downcase}]/).join.size == word_from_input.size
    end
end

