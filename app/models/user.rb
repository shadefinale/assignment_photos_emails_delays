class User < ActiveRecord::Base
  has_attached_file :profile_photo, :styles => { :medium => "300x300", :thumb => "100x100" }
  validates_attachment_content_type :profile_photo, :content_type => /\Aimage\/.*\Z/

  after_create :send_welcome

  private

  def send_welcome
    UserMailer.welcome(self).deliver!
  end
end
