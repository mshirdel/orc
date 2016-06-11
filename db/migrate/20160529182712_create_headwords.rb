class CreateHeadwords < ActiveRecord::Migration
  def change
    create_table :headwords do |t|
      t.string :dataset
      t.string :headword
      t.string :headword_id
      t.string :part_of_speech
      t.string :url

      t.timestamps null: false
    end
  end
end
