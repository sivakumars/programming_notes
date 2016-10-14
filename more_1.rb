def does_word_contain(match_string)
  words = ["laborator", "experiment", "Pans Labyrinth", "elaborate", "polar bear"]
  words.each do |word|
    if word =~ /lab/
      puts "The word, #{word}, contains #{match_string}."
    end
  end
end

does_word_contain("lab")
