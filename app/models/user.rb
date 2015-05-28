class User < ActiveRecord::Base
  # attr_accessible :roles
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :abilities, dependent: :destroy
  has_many :booksie_pages, through: :abilities
  has_many :photos, through: :booksie_pages
  has_many :videos, through: :booksie_pages
  has_many :milestones, through: :booksie_pages
  after_create :create_booksie_page

  def check_if_owner(booksie_page_id)
    booksie_page_id.nil? ? self.booksie_page : BooksiePage.find(booksie_page_id)
  end

  def booksie_page #my_booksie_page
    self.abilities.find_by(role: "owner").booksie_page
  end

  def contribute_pages
    self.abilities.where(role: "contributor").map(&:booksie_page)
  end

  def name
    user.first_name + user.last_name
  end

  private
  def create_booksie_page
    booksie = self.booksie_pages.create
    Ability.find_by(user: self, booksie_page: booksie).update(role: "owner")
  end
end
