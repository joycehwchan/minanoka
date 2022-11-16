class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @fields = Field.all[0..2]
  end

  def design
  end
end
