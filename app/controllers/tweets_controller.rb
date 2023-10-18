class TweetsController < ApplicationController

  before_action :authenticate_user! # 追加
  
    def index
        @tweets = Tweet.all
    end

    def new
        @tweet = Tweet.new
      end
    
      def create
        tweet = Tweet.new(tweet_params)
    
        tweet.user_id = current_user.id  #追記
    
        if tweet.save
          redirect_to action: "index"
        else
          redirect_to action: "new"
        end
      end

     

      def show
        @tweet = Tweet.find(params[:id])
        @comments = @tweet.comments
        @comment = Comment.new
      end

      def edit
        @tweet = Tweet.find(params[:id])
      end

      def update
        tweet = Tweet.find(params[:id])
        if tweet.update(tweet_params)
          redirect_to :action => "show", :id => tweet.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
        redirect_to action: :index
      end

      def dog
        @tweets = Post.all
      end
    
      def cat
        @tweets = Post.all
      end
    
      def rabbit
        @tweets = Post.all
      end
    
      def bird
        @tweets = Post.all
      end

      def hamster
        @tweets = Post.all
      end

      def others
        @tweets = Post.all
      end
    
      private
      def tweet_params
        params.require(:tweet).permit(:name, :category, :question, :image)
      end
end
