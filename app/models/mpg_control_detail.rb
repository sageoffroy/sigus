class MpgControlDetail < ApplicationRecord
  belongs_to :mpg_control
  belongs_to :agent, optional:true
end
