require_relative './spec_helper'

RSpec.describe InvoiceItem do
  before :each do
    @ii = InvoiceItem.new({
      :id => 6,
      :item_id => 7,
      :invoice_id => 8,
      :quantity => 1,
      :unit_price => BigDecimal(10.99, 4),
      :created_at => Time.now,
      :updated_at => Time.now
    })
  end

  it 'is an invoice item' do
    expect(@ii).to be_instance_of InvoiceItem
  end

  it 'returns the integer id' do
    expect(@ii.id).to eq(6)
  end

  it 'returns the item id' do
    expect(@ii.item_id).to eq(7)
  end

  it 'returns the invoice id' do
    expect(@ii.invoice_id).to eq(8)
  end

  it 'returns the quantity' do
    expect(@ii.quantity).to eq(1)
  end

end
