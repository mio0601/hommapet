class Tweet < ApplicationRecord

    mount_uploader :image, ImageUploader
    belongs_to :user

    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy

    def body
        # body メソッドの実装
      end

end
