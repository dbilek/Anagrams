require 'anagrams'

describe Anagrams do
  
  let(:anagrams) do
  	Anagrams.new()
  end

  anagrams_result = Hash.new()
  anagrams_result = { "abeorst" => ["boaters", "boaster", "borates"], "denrssu" => ["sunders", "undress"],
  "eefhrrs" => ["refresh", "fresher"] }

  describe "#find_anagrams" do
    
    it "return all the combinations of words that are anagrams from
    given file" do
      expect(anagrams.find_anagrams(anagrams.test_file)).to eql(anagrams_result)
    end

  end
end

