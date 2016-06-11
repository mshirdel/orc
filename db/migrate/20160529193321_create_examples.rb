class CreateExamples < ActiveRecord::Migration
  def change
    create_table :examples do |t|
      t.text :text
      t.belongs_to :sense, index: true
      t.string :audio_type
      t.string :audio_url

      t.timestamps null: false
    end
  end
end
