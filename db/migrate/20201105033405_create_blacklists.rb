class CreateBlacklists < ActiveRecord::Migration[6.0]
  def change
    create_table :blacklists do |t|
      t.string :word,      null: false
      t.boolean :flag,      null: false
      t.timestamps
    end
  end
end
