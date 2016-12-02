class CreatePokemon < ActiveRecord::Migration
  def change
    create_table :pokemon do |t|
      t.string :name
      t.string :sprite
      t.integer :team_id


      t.timestamps null:false
    end
  end
end
