require 'rails_helper'

RSpec.describe Text do

  subject{ Text.new description: "Dulse De Leche con amor." }

  it { should respond_to(:description) }
  it { should respond_to(:sentiment) }
  it { should respond_to(:sentences) }
  it { should respond_to(:entity) }

  context 'associations' do
    it { should belong_to(:entity).optional }
    it { should have_one(:sentiment).dependent(:destroy) }
    it { should have_many(:sentences).dependent(:destroy) }
  end

  context 'validations' do
    it { should validate_presence_of(:description) }
    it { should be_valid }
  end

  context 'nested attributes' do
    it { should accept_nested_attributes_for(:sentiment) }
    it { should accept_nested_attributes_for(:sentences) }
  end

  describe '#exec_sentiment_analysis'
end