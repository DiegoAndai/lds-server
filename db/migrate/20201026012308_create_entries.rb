class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.string :concept, null: false
      t.text :video_data, null: false

      t.timestamps
    end
  end
end
