class CreateResources < ActiveRecord::Migration[6.0]
  def change
    create_table :resources do |t|
      t.string :name
      t.boolean :available, default: false

      t.timestamps
    end
  end
end
