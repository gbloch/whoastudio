class AdminController < ApplicationController
  render layout "admin"
  # Dont allow unathenticated users past this point
end
