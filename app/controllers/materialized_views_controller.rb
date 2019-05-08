class MaterializedViewsController < ApplicationController
  before_action :authenticate_user!

  def refresh_mat_views
  end

  def refresh_views
    RefreshNewHighMaterializedViewWorker.perform_async
    head :no_content
  end
end
