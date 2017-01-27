class InvalidCodonError < StandardError
end

#
class Translation
  TRANSLATIONS = { ['AUG'] => 'Methionine',
                   ['UUU', 'UUC'] => 'Phenylalanine',
                   ['UUA', 'UUG'] => 'Leucine',
                   ['UCU', 'UCC', 'UCA', 'UCG'] => 'Serine',
                   ['UAU', 'UAC'] => 'Tyrosine',
                   ['UGU', 'UGC'] => 'Cysteine',
                   ['UGG'] => 'Tryptophan',
                   ['UAA', 'UAG', 'UGA'] => 'STOP' }.freeze

  def self.of_codon(codon)
    raise InvalidCodonError unless TRANSLATIONS.keys.flatten.include?(codon)

    TRANSLATIONS.select do |codons, _|
      codons.include?(codon)
    end.values.first
  end

  def self.of_rna(strand)
    result = []
    strand.chars.each_slice(3) do |codon|
      return result if of_codon(codon.join) == 'STOP'
      result << of_codon(codon.join)
    end
    result
  end
end
