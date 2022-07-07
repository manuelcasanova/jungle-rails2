class Sale < ApplicationRecord


  #This is an Active Record scope
  def self.active
    where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current)
  end

  
  def finished?
    ends_on < Date.current
  end

  def upcoming?
    starts_on > Date.current
  end

  #We don't need active function for the admin all sales status but we might need it at a later point.
  def active?
    !upcoming? && !finished?
  end

end
