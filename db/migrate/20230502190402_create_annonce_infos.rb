class CreateAnnonceInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :annonce_infos do |t|
      t.string :title
      t.text :description
      t.string :price
      t.string :location
      t.string :links
      t.string :pictures

      t.timestamps
    end
  end
end
