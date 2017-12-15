class NoveltyDetail < ApplicationRecord
  belongs_to :novelty
  belongs_to :agent
  belongs_to :novelty_type


  
end
