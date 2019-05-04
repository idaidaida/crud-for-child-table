class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :hobby
      t.string :birthplace
      t.references :account
      t.timestamps
    end
  end
end
