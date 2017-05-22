class PagesController < ApplicationController
  def home
    if current_user
      redirect_to brands_path
    end
  end
end
