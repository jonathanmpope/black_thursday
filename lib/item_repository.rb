require 'csv'
require 'BigDecimal'
require_relative './enumerable'

class ItemRepository
  include Enumerable
  attr_accessor :all

  def initialize(file_path)
    @file_path = file_path
    @all = []

    CSV.foreach(file_path, headers: true, header_converters: :symbol) do |row|
      @all << Item.new({
        id: row[:id].to_i, name: row[:name], description: row[:description], unit_price: BigDecimal(row[:unit_price].to_i * 0.01, 4), merchant_id: row[:merchant_id].to_i, created_at: row[:created_at], updated_at: row[:updated_at]})
    end
  end

  def find_all_with_description(description)
    @all.find_all {|row| row.description.include?(description)}
  end

  def find_all_by_price(price)
    @all.find_all {|row| row.unit_price_to_dollars == price}
  end

  def find_all_by_price_in_range(range)
    @all.find_all {|row| range.include?(row.unit_price)}
  end



  def create(item)
    i = Item.new({
      id: @all.last.id + 1,
      name: item[:name],
      description: item[:description],
      unit_price: item[:unit_price],
      created_at: item[:created_at],
      updated_at: item[:updated_at],
      merchant_id: item[:merchant_id]
      })
    @all.append(i)
    i
  end
end
