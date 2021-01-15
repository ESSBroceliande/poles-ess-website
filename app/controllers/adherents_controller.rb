class AdherentsController < ApplicationController
  include SlugsAndRedirections

  before_action :set_breadcrumbs

  def index
    @adherent_categories = AdherentCategory.having_adherents.includes(:adherents).order(:position)
  end

  private # =====================================================

  def set_breadcrumbs
    @breadcrumbs = []
    @breadcrumbs << [ "Accueil",    root_path ]
    @breadcrumbs << [ "Le pôle",    main_page_path(MainPage.find_by(title: "Le pôle")) ]
    @breadcrumbs << [ "Adhérents",      adherents_path ]
  end
end