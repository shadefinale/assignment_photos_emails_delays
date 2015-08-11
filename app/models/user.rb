class User < ActiveRecord::Base
  has_attached_file :profile_photo, :styles => { :medium => "300x300", :thumb => "100x100" }
  validates_attachment_content_type :profile_photo, :content_type => /\Aimage\/.*\Z/
  after_create :send_delayed_email

  private

  def send_delayed_email
    User.delay.send_welcome_email(self.id)
  end

  def self.send_welcome_email(id)
    user = User.find(id)
    UserMailer.welcome(user).deliver
  end

end
