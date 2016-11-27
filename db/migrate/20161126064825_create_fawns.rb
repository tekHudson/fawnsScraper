class CreateFawns < ActiveRecord::Migration[5.0]
  def change
    create_table :fawns, id: false do |t|
      t.string :fawn_id, null: false
      t.column :owner_name, :string
      t.column :coat, :string
      t.column :ears, :string
      t.column :tail, :string
      t.column :antlers, :string
      t.column :eyes, :string
      t.column :persona, :string
      t.column :max_size, :string
      t.column :age, :string
      t.column :gender, :string
      t.column :training, :string
      t.column :fwn_points, :string
      t.timestamps
    end

    add_index :fawns, :fawn_id, unique: true
  end
end
