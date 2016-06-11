class CreateSenses < ActiveRecord::Migration
  def change
    create_table :senses do |t|
      t.string :definition
      t.belongs_to :headword, index: true
      t.string :opposite

      t.timestamps null: false
    end
  end
end
