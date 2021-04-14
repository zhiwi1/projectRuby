class PostsController < ApplicationController

  def index
    params[:tag] ? @posts = Post.tagged_with(params[:tag]) : @posts = Post.all
    @users = User.all.sort_by(&:solver_rate)

    @persons_in_top = @users.map { |user| user.email.to_s }.compact.first(3)
    # @user.map(user -> user.getEmail())
    @users.compact
    @pp = Post.all
    @pp.each do |post|
      @users.each do |user|
        if Answer.exists?(post_id: post.id,user_id: user.id,checkForSolve: true)
          post.update_attribute(:countforsolve,post.countforsolve +=1)
          Answer.find_by(post_id: post.id,user_id: user.id,checkForSolve: true).update_attribute(:checkForSolve , false)
        end
      end
    end

    @possst = Post.all.sort_by(&:countforsolve)
    @intop = @possst.map { |p| p.title.to_s}.compact.reverse.first(3)
    @tags = Tag.all
    @taging = Tagging.all
    @pp.each do |post|
      @tags.each do |tag|
        if Tagging.exists?(post_id: post.id,tag_id: tag.id,check: true)
          tag.update_attribute(:count,tag.count +=1)
          Tagging.find_by(post_id: post.id,tag_id: tag.id,check: true).update_attribute(:check, false)
        end
      end
    end
    @taggg = Tag.all.sort_by(&:count)

    @tagtop = @taggg.map { |p| p.name.to_s}.compact.reverse.first(5)

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