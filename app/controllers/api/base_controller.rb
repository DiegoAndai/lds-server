class Api::BaseController < PowerApi::BaseController
  skip_before_action :verify_authenticity_token
end
