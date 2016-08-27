class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :body
      t.belongs_to :group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
