class AddCreatedAtToAnnonceInfo < ActiveRecord::Migration[7.0]
  def change
    add_column :annonce_infos, :createdAt, :datetime,default: -> { 'CURRENT_TIMESTAMP' }
  end
end
