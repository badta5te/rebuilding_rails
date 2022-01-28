# frozen_string_literal: true

class Array
  def sum(start = 0)
    inject(start, &:+)
  end

  def stringify(array)
    array.each do |e|
      puts e
    end
  end
end
