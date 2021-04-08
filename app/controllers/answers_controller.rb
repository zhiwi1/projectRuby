class AnswersController < ApplicationController
  def new
    @post = find_post
    @answer = @post.answers.build
  end

  def create
    @post = find_post
    @post_id = @post.id.dup
    @user_id = current_user.id.dup
    @answer = @post.answers.build(answer_params.merge(post_id: @post_id,user_id: @user_id))
    if @answer.save
      if !Post.exists?(:user_id => current_user.id)
        @persons_s = User.all
        @persons_s.each do |person|
            if Post.exists?(:user_id => person.id)
               person.author_rates += @answer.rates.to_i
               person.save
              break
            end
        end
      end
    if (@answer.reply.strip.eql?(@post.answer1.strip) || @answer.reply.strip.eql?(@post.answer2.strip)) && !@post.answer1.strip.empty? && !@post.answer2.strip.empty?
      current_user.count_of_solve +=1
      current_user.avarage_of_solve += @post.hard.to_i
      current_user.save
      redirect_to "/posts"
    else
      redirect_to "/posts"
    end
    end
    end

  private

  def find_post
    Post.find(params[:post_id])
  end

  def answer_params
    params.require(:answer).permit(:post_id, :user_id, :reply,:rates)
  end
end
