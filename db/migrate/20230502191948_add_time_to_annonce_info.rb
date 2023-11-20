class AddTimeToAnnonceInfo < ActiveRecord::Migration[7.0]
  def change
    add_column :annonce_infos, :time, :string
  end
end
