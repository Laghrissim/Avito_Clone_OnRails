class AnnoncesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_annonce, only: [:show, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]

  def new
    @annonce = Annonce.new
  end

  def create
    @annonce = current_user.annonces.build(annonce_params)
    if @annonce.save
      redirect_to annonces_index_path, notice: 'L\'annonce a été créée avec succès.'
    else
      render :new
    end
  end
  def index
    @annonces = current_user.annonces.order(created_at: :desc)
    @annonces = current_user.where(category_id: params[:category_id]) if params[:category_id].present?
    @annonces = current_user.where(ville_id: params[:ville_id]) if params[:ville_id].present?
  end
  def edit
  end

  def update
    if @annonce.update(annonce_params)
      redirect_to annonces_index_path, notice: 'L\'annonce a été mise à jour avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @annonce.destroy
    redirect_to annonces_url, notice: 'Annonce a été détruite avec succès.'
  end

  private

  def set_annonce
    @annonce = Annonce.find(params[:id])
  end

  def check_owner
    if @annonce.user != current_user
      redirect_to @annonce, alert: "Vous n'êtes pas autorisé à effectuer cette action."
    end
  end

  def annonce_params
    params.require(:annonce).permit(:title, :description, :price, :etat, :type_transaction, :ville_id, :category_id, images: [])
  end
end
