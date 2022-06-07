class PagesController < ApplicationController
  def demo
  end

  def home
  end

  def tags
    @users = User.all
    @data = {code: '1-2-3', msg: 'Hello world'}
  end
end
