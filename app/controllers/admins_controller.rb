class AdminsController < ApplicationController
  layout "admin"

  # Dont allow unathenticated users past this point
  before_action :authenticate_admin!
end
