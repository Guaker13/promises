class User < ActiveRecord::Base
  has_one :worker, dependent: :destroy
  has_one :business
  has_many :workspaces, through: :business
  accepts_nested_attributes_for :worker
  after_create :create_worker

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable, :omniauth_providers => [:facebook, :linkedin]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.first_name   # assuming the user model has a name
      user.last_name = auth.info.last_name
      user.avatar = auth.info.image # assuming the user model has an image
    end
  end

  def create_worker
   user_worker = Worker.new(user: self)
   user_worker.save!(validate: false)
  end
end
