class HealthcheckController < ApplicationController

  # set_browser_id comes from the Authie gem
  skip_before_action :login_required, :set_browser_id

  def index
    if params[:probe] == "ready"
      begin
        Organization.count
      rescue => e
        render :plain => "Error: #{e}", :status => :internal_server_error and return
      end
    end
    render :plain => "OK"
  end
end
