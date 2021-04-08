class PostsController < ApplicationController

  def index
    params[:tag] ? @posts = Post.tagged_with(params[:tag]) : @posts = Post.all
    @users = User.all
    @users.sort_by(&:count_of_solve)
    @persons_in_top = []
    if !@users[0].nil? && !@users[0].blank?
      @persons_in_top << @users[0].email
    end
    if !@users[1].nil? && !@users[1].blank?
      @persons_in_top << @users[1].email
    end
    if !@users[2].nil? && !@users[2].blank?
      @persons_in_top << @users[2].email
    end
  end
  def show
    @post = Post.find(params[:id])
  end
  def new
    @post = current_user.posts.build
  end
  def create
    @tag_ids = []
    params['post']['tag_ids'].delete_if(&:blank?)
    params['post']['tag_ids'].each do |data|
      if Tag.exists?(:id => data)
        @tag_ids << data.to_s
        next
      end
        data_name = data.dup
        data = Tag.create(:name => data_name)
        @tag_ids << data.id.to_s
    end
    @tag_ids.delete_if(&:blank?)
    @post = current_user.posts.build(post_params.merge(tag_ids: @tag_ids))
    if @post.save
      redirect_to "/posts"
    else
      render :new
    end
  end
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to "/posts"
  end
  private
  def post_params
  params.require(:post).permit(:title,:hard,:answer1,:answer2, :content, :tag_list, :tag, { tag_ids: [] }, :tag_ids)
end
end