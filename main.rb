require_relative "lib/anagrams.rb"

anagrams = Anagrams.new()

anagrams.find_anagrams(anagrams.anagrams_wordlist).each do |key, value|
	puts value.join(" ") if value.size > 1
end

