require_relative "lib/anagrams.rb"

anagram = Anagram.new("anagrams_wordlist/anagrams-wordlist.txt")

anagram.read_anagrams(anagram.find_anagrams)

