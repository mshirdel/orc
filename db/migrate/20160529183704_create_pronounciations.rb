class CreatePronounciations < ActiveRecord::Migration
  def change
    create_table :pronounciations do |t|
      t.string :ipa
      t.belongs_to :headword, index: true

      t.timestamps null: false
    end
  end
end
