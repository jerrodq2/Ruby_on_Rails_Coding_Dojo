class Dojo < ActiveRecord::Base
  has_many :ninjas
  validates :state, length: {is: 2}
  validates :name, :city, :state, presence: true


  before_destroy :delete_ninjas

  def delete_ninjas
    Dojo.find(self.id).ninjas.destroy_all
  end
end
