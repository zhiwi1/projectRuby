class AnswersController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @answer = @post.answers.build
  end
  def create
    @post_id = @post.id.dup
    @user_id = current_user.id.dup
    @answer = @post.answers.build(answer_params.merge(post_id: @post_id,user_id: @user_id))
    if (@answer.reply.strip.eql?(@post.answer1.strip) || @answer.reply.strip.eql?(@post.answer2.strip)) && @answer.save
      redirect_to "/posts"
    else
      render :new
    end
  end
  def answer_params
    params.require(:answer).permit(:post_id, :user_id, :reply)
  end
end
