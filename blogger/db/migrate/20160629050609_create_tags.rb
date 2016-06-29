class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.string :string

      t.timestamps null: false
    end
  end
end
