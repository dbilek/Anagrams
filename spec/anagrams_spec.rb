require 'anagrams'

describe Anagrams do
  
  anagrams_result = %w{ cuprites pictures piecrust crepitus }
  describe "#find_anagrams" do
    
    it "return all the combinations of words that are anagrams from
    given file" do
      expect(Anagrams.new().find_anagrams).to eql(anagrams_result)
    end
  end
end

