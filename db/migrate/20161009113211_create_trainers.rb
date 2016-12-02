class CreateTrainers < ActiveRecord::Migration
  def change
    create_table :trainers do |t|
      t.string :name
      t.string :gender
      t.string :email
      t.string :password_hash

      t.timestamps null:false
    end
  end
end
