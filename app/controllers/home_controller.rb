

class HomeController < ApplicationController

    
      
    def home
        if params[:keyword].present?
            @annonces = AnnonceInfo.where('title LIKE ?', "%#{params[:keyword]}%").page(params[:page])
          else
            @annonces = AnnonceInfo.all.page(params[:page])
          end
    end
    
    def show
        @annonce = AnnonceInfo.find(params[:id])
    end
end
