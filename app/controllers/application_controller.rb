class ApplicationController < ActionController::Base
  include Pagy::Backend

  skip_before_action :verify_authenticity_token, if: -> { request.format.json? }
end
