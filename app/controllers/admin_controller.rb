class AdminController < ApplicationController


  def index
    @annonces = AnnonceInfo.all
  end
  def show
    @annonces = Annonce.all

  end

  end

