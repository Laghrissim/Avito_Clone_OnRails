class ContactController < ApplicationController
    def new
      @contact = Contact.new
    end
    def create
        @contact = Contact.new(contact_params)
        if @contact.save
          flash[:success] = "Thank you We will be in touch soon."
          redirect_to root_path
        else
          flash[:error] = "Oops! Something went wrong. Please try again."
          render :new
        end
    end
    
      private
    
      def contact_params
        params.require(:contact).permit(:name, :email, :boutique_name, :country, :message)
      end
end


