class CreateSentimentTracker < ActiveRecord::Migration[6.0]
  def change
    create_table :texts do |t|
      t.string :description
      t.references :entity, polymorphic: true, index: true
      t.timestamps
    end

    create_table :sentences do |t|
      t.string :description
      t.references :text, foreign_key: true, index: true
      t.timestamps
    end

    create_table :sentiments do |t|
      t.string :polarity
      t.string :kind
      t.references :entity, polymorphic: true, index: true
      t.timestamps
    end
  end
end