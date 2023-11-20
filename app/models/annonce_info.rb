class AnnonceInfo < ApplicationRecord
    paginates_per 10

    
    before_save :set_created_at

  
    private
    
    def set_created_at
      self.created_at ||= Time.now
    end
end
