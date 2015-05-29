class BooksiePage < ActiveRecord::Base
  #before_create :
  has_many :abilities, dependent: :destroy
  has_many :users, through: :abilities
  has_many :photos, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :milestones, dependent: :destroy

  scope :contributor, ->(user) { joins(:ability).where(abilities: {role: "contributor"}) }

  def recent_milestones
  	milestones.limit(20).sort_by(&:date).reverse
  end

  def owner
    self.abilities.find_by(role: "owner").user
  end
end

