class CreateAudios < ActiveRecord::Migration
  def change
    create_table :audios do |t|
      t.string :lang
      t.string :type
      t.string :url
      t.belongs_to :pronounciation, index: true

      t.timestamps null: false
    end
  end
end
