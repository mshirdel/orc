class CreateHeadwordJobs < ActiveRecord::Migration
  def change
    create_table :headword_jobs do |t|
      t.string :head_word, :unique => true
      t.boolean :is_done

      t.timestamps null: false
    end
  end
end
