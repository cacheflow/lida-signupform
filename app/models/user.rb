class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_attached_file(:avatar,
          :default_url => 'http://will.i.am/img/app/footer-image.png',
          :styles => {:medium => "300x300>", :thumb => "100x100>"})
   validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
