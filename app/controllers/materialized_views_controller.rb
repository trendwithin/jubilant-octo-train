class MaterializedViewsController < ApplicationController
  def refresh_mat_views
  end

  def refresh_views
    RefreshNewHighMaterializedViewWorker.new.process
    head :no_content
  end
end
