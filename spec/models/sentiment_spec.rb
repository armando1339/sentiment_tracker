require 'rails_helper'

RSpec.describe Sentiment do

  subject{ Sentiment.new polarity: "0.2", kind: "Positive" }

  it { should respond_to(:polarity) }
  it { should respond_to(:kind) }
  it { should respond_to(:entity) }

  context 'associations' do
    it { should belong_to(:entity).optional }
  end

  context 'validations' do
    it { should validate_presence_of(:polarity) }
    it { should validate_presence_of(:kind) }
    it { should be_valid }
  end
end