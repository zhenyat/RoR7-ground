class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  
  def to_s
    "#{self.class} | #{self.name}"
  end
end
