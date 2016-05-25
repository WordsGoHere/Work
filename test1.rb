
class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other)
    distance = 0
    strand.length.times do |i|
      break if other[i] == nil
      distance += 1 unless strand[i] == other[i]
    end
    puts distance
  end
  
end

DNA.new('ATACG').hamming_distance('GGTCG')