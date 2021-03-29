class PostsController < ApplicationController

  def index
    params[:tag] ? @posts = Post.tagged_with(params[:tag]) : @posts = Post.all
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
      redirect_to @post
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
  params.require(:post).permit(:title,:hard, :content, :tag_list, :tag, { tag_ids: [] }, :tag_ids)
end
end