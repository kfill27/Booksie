class User < ActiveRecord::Base
  # attr_accessible :roles
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :abilities
  has_many :booksie_pages, through: :abilities
  after_create :create_booksie_page

  private
  def create_booksie_page
    booksie = self.booksie_pages.create
    Ability.find_by(user: self, booksie_page: booksie).update(role: "admin")
  end
end
