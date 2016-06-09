class StaticPagesController < ApplicationController
  def home
    @var  = 5*5
  end

  def help
  end

  def about
  end

  def unknown_path
  end
end
