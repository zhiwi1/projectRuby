class PersonsController < ApplicationController
  before_action :authenticate_user!

  def profile
  end

  def index
    @persons = User.all
  end

  def show
    @person = User.find(params[:id])
    @answerfirst = Answer.first.user_id
    @firstUser = User.first.id
    @person_posts = @person.posts
  end
end
