class Item
    attr_reader :name, :price
    def initialize(matrix)
        @name = matrix[:name]
        @price = matrix[:price][1..matrix[:price].length-1].to_f
    end
end