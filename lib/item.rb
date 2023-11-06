class Item
    attr_reader :name, :price
    def initialize(matrix)
        @name = matrix(:name)
        @price = matrix(:price)
    end
end