class PagesController < ApplicationController
  def home
    @admin_mode = user_signed_in? && current_user.admin?
  end

  def about
  end
end
