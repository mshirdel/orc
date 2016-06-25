class CreatePearsons < ActiveRecord::Migration
  def change
    create_table :pearsons do |t|
      t.string :word
      t.text :response

      t.timestamps null: false
    end
  end
end
