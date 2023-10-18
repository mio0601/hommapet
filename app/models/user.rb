class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :tweets, dependent: :destroy     

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :tweets, dependent: :destroy #追記 ユーザーが削除されたら、ツイートも削除されるようになります。すでに書いてある場合は追記しなくて大丈夫です。
  has_many :likes, dependent: :destroy
  has_many :liked_tweets, through: :likes, source: :tweet

  def already_liked?(tweet)
    self.likes.exists?(tweet_id: tweet.id)
  end

  validates :name, presence: true #追記
  validates :profile, length: { maximum: 200 } #追記


  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships
  has_many :comments, dependent: :destroy
  
  
    def following?(other_user)
      following_relationships.find_by(following_id: other_user.id)
    end
  
    def follow!(other_user)
      following_relationships.create!(following_id: other_user.id)
    end
  
    def unfollow!(other_user)
      following_relationships.find_by(following_id: other_user.id).destroy
    end
  
end
