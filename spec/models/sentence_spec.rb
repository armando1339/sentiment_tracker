require 'rails_helper'

RSpec.describe Sentence do

  subject{ Sentence.new description: "Dulse De Leche con amor." }

  it { should respond_to(:description) }
  it { should respond_to(:sentiment) }
  it { should respond_to(:text) }

  context 'associations' do
    # it { should belong_to(:text) }
    it { should have_one(:sentiment).dependent(:destroy) }
  end

  context 'validations' do
    it { should validate_presence_of(:description) }
    it { should be_valid }
  end

  context 'nested attributes' do
    it { should accept_nested_attributes_for(:sentiment) }
  end
end