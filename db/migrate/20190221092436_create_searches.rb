class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.text :word

      t.timestamps
    end
  end
end
