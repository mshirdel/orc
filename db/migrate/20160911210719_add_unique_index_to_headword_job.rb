class AddUniqueIndexToHeadwordJob < ActiveRecord::Migration
  def change
  	add_index :headword_jobs, :head_word, :unique => true
  end
end
