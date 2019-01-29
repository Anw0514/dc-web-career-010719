class CreateApples < ActiveRecord::Migration[5.2]
  def change
    create_table :apples do |t|
        t.string :name
        t.string :crunchiness
        t.text :summary
        t.integer :versatility
        t.string :sweetness
        t.string :origin
        t.boolean :pie?
        t.string :parentage
    end
  end
end
