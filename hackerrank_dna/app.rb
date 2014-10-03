# https://www.hackerrank.com/challenges/save-humanity

class SaveHumanity
  def evaluate(first, second)
    result = []
    first_char = second[0]
    first.split('').each_with_index do |c, i|
      if c == first_char && i < first.length - 1
        result << i
      end
    end
    result
  end
end