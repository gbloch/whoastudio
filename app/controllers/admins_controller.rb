class AdminsController < ApplicationController
  layout "admin"
  before_action :authenticate_admin!
  skip_before_action:verify_authenticity_token
end
