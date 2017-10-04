require 'anagrams'

describe Anagram do

	anagrams_result = [["refresh", "fresher"], ["sunders", "undress"], ["boaters", "boaster", "borates"], [" abc", "bc'a"]]
  
  describe "#find_anagrams" do
 
    it "return all the combinations of words that are anagrams from given file" do
    	anagram = Anagram.new("anagrams_wordlist/test_file.txt")
      expect(anagram.find_anagrams).to eql(anagrams_result)
    end

    it "strips white space from word" do
    	anagram = Anagram.new([" abc ","bca ","dbc"," cbd "])
      expect(anagram.find_anagrams).to eql([[ " abc " ,"bca " ], [ "dbc", " cbd " ]])
    end
		
		it "ignores letter case" do
			anagram = Anagram.new(["aBc","bcA","Dbc","cBd"])
      expect(anagram.find_anagrams).to eql([[ "aBc" ,"bcA" ], [ "Dbc", "cBd" ]])
		end

		it "ignores everything except letters" do
			anagram = Anagram.new(["ab'c","bca","dbc","cb'd"])
      expect(anagram.find_anagrams).to eql([[ "ab'c" ,"bca" ], [ "dbc", "cb'd" ]])
		end

		it "ignores words with one character" do
			anagram = Anagram.new(["abc","bca","dbc","cbd","a","b"])
      expect(anagram.find_anagrams).to eql([[ "abc" ,"bca" ], [ "dbc", "cbd" ]])
		end

		it "ignores words without anagrams" do
			anagram = Anagram.new(["abc","bca","dbc","cbd","foo","bar","baz"])
      expect(anagram.find_anagrams).to eql([[ "abc" ,"bca" ], [ "dbc", "cbd" ]])
		end
		
		it "ignores duplicate words" do
			anagram = Anagram.new(["abc","abc","abc","bca","dbc","dbc","dbc","cbd"])
      expect(anagram.find_anagrams).to eql([[ "abc" ,"bca" ], [ "dbc", "cbd" ]])
		end

  end
end

