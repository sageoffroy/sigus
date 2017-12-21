class AdditionalDetail < ApplicationRecord
  belongs_to :additional
  belongs_to :agent
  
  belongs_to :rotative_turn, optional:true
  
  accepts_nested_attributes_for :rotative_turn
end
