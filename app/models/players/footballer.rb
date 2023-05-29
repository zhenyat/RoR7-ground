class Footballer < Player
  store_accessor :club, :city

  def self.permitted_params
    [:club, :phone_number]
  end
end