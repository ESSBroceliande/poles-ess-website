class ResourcesController < ApplicationController

  def index
    @resources = Resource.enabled.apply_filters(params).order(:created_at).page(params[:page]).per(20)
    @resource_themes = Theme.enabled.having_resources.order(:position)
    @resource_profiles = Profile.enabled.having_resources.order(:position)
  end

  private # =====================================================

  def get_post
    @post = get_object_from_param_or_redirect(Post)
  end


end
